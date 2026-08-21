import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Service for managing live portfolio visit traffic counts with a 1.4k baseline offset.
class VisitorCounterService {
  VisitorCounterService._();
  static final VisitorCounterService instance = VisitorCounterService._();

  static const String _namespace = 'vishnupriyan_portfolio';
  static const String _counterKey = 'visits';
  static const String _apiEndpoint =
      'https://api.counterapi.dev/v1/$_namespace/$_counterKey';

  /// Baseline visitor count offset so initial launch starts at a healthy baseline (1.4k+)
  static const int baseOffset = 1420;

  final ValueNotifier<int> visitCount = ValueNotifier<int>(baseOffset);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  bool _hasIncremented = false;

  /// Fetch visitor count and increment once per session in release mode.
  /// In debug mode (development), skips incrementing to avoid inflating numbers.
  Future<int> recordVisit() async {
    // In local development / debug mode, display baseline without incrementing live counter
    if (kDebugMode) {
      visitCount.value = baseOffset;
      isLoading.value = false;
      return baseOffset;
    }

    if (_hasIncremented && visitCount.value > baseOffset) {
      return visitCount.value;
    }

    isLoading.value = true;
    try {
      final url = Uri.parse('$_apiEndpoint/up');
      final response = await http.get(url).timeout(const Duration(seconds: 4));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final liveCount = (data['count'] as num?)?.toInt() ?? 0;
        final total = baseOffset + (liveCount > 0 ? liveCount : 1);
        visitCount.value = total;
        _hasIncremented = true;
        isLoading.value = false;
        return total;
      }
    } catch (e) {
      debugPrint(
        '[VisitorCounter] Count API unreachable, using baseline offset: $e',
      );
    }

    visitCount.value = baseOffset + 1;
    isLoading.value = false;
    return visitCount.value;
  }

  /// Get current cached count
  int get currentCount => visitCount.value;
}
