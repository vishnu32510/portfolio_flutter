import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Service for managing live portfolio visit traffic counts.
class VisitorCounterService {
  VisitorCounterService._();
  static final VisitorCounterService instance = VisitorCounterService._();

  static const String _namespace = 'vishnupriyan_portfolio';
  static const String _counterKey = 'visits';
  static const String _apiEndpoint =
      'https://api.counterapi.dev/v1/$_namespace/$_counterKey';

  final ValueNotifier<int> visitCount = ValueNotifier<int>(0);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  bool _hasIncremented = false;

  /// Fetch visitor count and increment once per session
  Future<int> recordVisit() async {
    if (_hasIncremented && visitCount.value > 0) {
      return visitCount.value;
    }

    isLoading.value = true;
    try {
      // Use the 'up' action to increment and retrieve updated count
      final url = Uri.parse('$_apiEndpoint/up');
      final response = await http.get(url).timeout(const Duration(seconds: 4));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final count = (data['count'] as num?)?.toInt() ?? 0;
        if (count > 0) {
          visitCount.value = count;
          _hasIncremented = true;
          isLoading.value = false;
          return count;
        }
      }
    } catch (e) {
      debugPrint(
        '[VisitorCounter] Count API unreachable, attempting fallback: $e',
      );
    }

    // Fallback: if counter API is unreachable or slow, retrieve static or mock baseline
    if (visitCount.value == 0) {
      visitCount.value = 1420; // Baseline fallback
    }
    isLoading.value = false;
    return visitCount.value;
  }

  /// Get current cached count without incrementing
  int get currentCount => visitCount.value;
}
