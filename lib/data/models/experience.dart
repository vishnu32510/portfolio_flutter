class Experience {
  final String title;
  final String company;
  final String period;
  final List<String> achievements;

  /// Official company / product site (opens in browser).
  final String? companyUrl;

  /// Optional logo URL; if null but [companyUrl] is set, UI may use a favicon.
  final String? logoUrl;

  /// When true, the logo chip uses a black fill in light theme so light favicons stay visible.
  final bool logoChipBlackInLight;

  const Experience({
    required this.title,
    required this.company,
    required this.period,
    required this.achievements,
    this.companyUrl,
    this.logoUrl,
    this.logoChipBlackInLight = false,
  });

  factory Experience.fromFirestore(Map<String, dynamic> data) {
    return Experience(
      title: data['title'] ?? '',
      company: data['company'] ?? '',
      period: data['period'] ?? '',
      achievements: List<String>.from(data['achievements'] ?? []),
      companyUrl: data['companyUrl'] as String?,
      logoUrl: data['logoUrl'] as String?,
      logoChipBlackInLight: data['logoChipBlackInLight'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'company': company,
      'period': period,
      'achievements': achievements,
      if (companyUrl != null) 'companyUrl': companyUrl,
      if (logoUrl != null) 'logoUrl': logoUrl,
      if (logoChipBlackInLight) 'logoChipBlackInLight': logoChipBlackInLight,
    };
  }
}
