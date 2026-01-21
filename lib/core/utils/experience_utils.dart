class ExperienceUtils {
  ExperienceUtils._();

  /// Convert period string to timeline format (e.g., "OCT 2025 - Present" -> "Oct 2025 — Present")
  static String convertToTimeline(String period) {
    // Check if period contains "Present" or "Current"
    final isPresent = period.toUpperCase().contains('PRESENT') || 
                     period.toUpperCase().contains('CURRENT');
    
    if (isPresent) {
      // Extract start date
      final parts = period.split(RegExp(r'\s*-\s*', caseSensitive: false));
      if (parts.isNotEmpty) {
        final startPart = parts[0].trim();
        // Try to format the date part
        return '$startPart — Present';
      }
    }
    
    // Replace common separators with em dash
    return period.replaceAll(RegExp(r'\s*-\s*'), ' — ');
  }

  /// Check if experience is current (present)
  static bool isPresent(String period) {
    return period.toUpperCase().contains('PRESENT') || 
           period.toUpperCase().contains('CURRENT');
  }

  /// Get experience type based on title/company
  static String getExperienceType(String title, String company) {
    final titleLower = title.toLowerCase();
    if (titleLower.contains('intern')) return 'Internship';
    if (titleLower.contains('founder') || titleLower.contains('co-founder')) return 'Freelance';
    if (titleLower.contains('part')) return 'Part Time';
    return 'Full Time';
  }
}
