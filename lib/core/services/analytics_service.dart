import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'analytics/web_gtag.dart';

/// Cross-platform Google Analytics 4 (GA4) service with zero native bloat.
/// Supports both Web (gtag.js) and Measurement Protocol HTTP REST for all platforms.
class AnalyticsService {
  AnalyticsService._();
  static final AnalyticsService instance = AnalyticsService._();

  // Configurable GA4 ID (Override via --dart-define=GA_MEASUREMENT_ID=G-XXXXXXXXXX)
  static const String measurementId = String.fromEnvironment(
    'GA_MEASUREMENT_ID',
    defaultValue: 'G-G4C2K609VC',
  );

  static const String apiSecret = String.fromEnvironment(
    'GA_API_SECRET',
    defaultValue: '',
  );

  static String? _clientId;
  static String? _appVersion;
  static bool _initialized = false;

  /// Initialize client session identifier and app version
  static Future<void> initialize() async {
    if (_initialized) return;
    _clientId = 'visitor_${DateTime.now().millisecondsSinceEpoch}';
    _initialized = true;

    try {
      final info = await PackageInfo.fromPlatform();
      _appVersion = '${info.version}+${info.buildNumber}';
    } catch (_) {
      _appVersion = '1.0.0';
    }
  }

  /// Log generic event to GA4
  static Future<void> logEvent(
    String eventName, [
    Map<String, dynamic>? parameters,
  ]) async {
    if (!_initialized) {
      await initialize();
    }

    final enrichedParams = <String, dynamic>{
      if (_appVersion != null) 'app_version': _appVersion,
      ...?parameters,
    };

    // 1. Web Native gtag.js integration (safely no-ops on VM/test/mobile)
    if (kIsWeb) {
      callWebGtag(eventName, enrichedParams);
    }

    // 2. Cross-platform Measurement Protocol (HTTP) fallback/reporting
    if (measurementId != 'G-MEASUREMENT_ID' && apiSecret.isNotEmpty) {
      unawaited(() async {
        try {
          final uri = Uri.parse(
            'https://www.google-analytics.com/mp/collect?measurement_id=$measurementId&api_secret=$apiSecret',
          );

          final payload = {
            'client_id': _clientId ?? 'anonymous',
            'events': [
              {
                'name': eventName,
                'params': {
                  'engagement_time_msec': 100,
                  'session_id': _clientId,
                  ...enrichedParams,
                },
              },
            ],
          };

          await http.post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(payload),
          );
        } catch (e) {
          debugPrint('[Analytics] HTTP Measurement Protocol error: $e');
        }
      }());
    }

    if (kDebugMode) {
      debugPrint('[Analytics Event] $eventName: $parameters');
    }
  }

  /// Log screen or section navigation
  static void logScreenView(String screenName) {
    logEvent('screen_view', {
      'screen_name': screenName,
      'screen_class': screenName,
    });
  }

  /// Log general page view
  static void logPageView(String path, [String? title]) {
    logEvent('page_view', {'page_path': path, 'page_title': title ?? path});
  }

  /// Log resume download or viewing
  static void logResumeClick({String source = 'resume_button'}) {
    logEvent('click_resume', {
      'source': source,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Log project demo or source code clicks
  static void logProjectClick({
    required String projectName,
    required String linkType, // 'Code' | 'Demo'
    String? url,
  }) {
    logEvent('click_project', {
      'project_name': projectName,
      'link_type': linkType,
      'url': ?url,
    });
  }

  /// Log social icon clicks
  static void logSocialClick({required String platform, required String url}) {
    logEvent('click_social', {'platform': platform, 'url': url});
  }

  /// Log theme change (light / dark)
  static void logThemeToggle(bool isDark) {
    logEvent('toggle_theme', {'mode': isDark ? 'dark' : 'light'});
  }

  /// Log skill chip exploration
  static void logSkillClick(String skillName) {
    logEvent('click_skill', {'skill_name': skillName});
  }
}
