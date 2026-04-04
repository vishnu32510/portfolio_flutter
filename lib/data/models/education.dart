class Education {
  /// Full degree title (legacy / Firestore); used when [level] and [major] are absent.
  final String degree;

  /// Short level shown on line 1, e.g. "Master's", "Bachelor's".
  final String? level;

  /// Field of study on line 2, e.g. "Computer Science".
  final String? major;

  final String institution;
  final String period;
  final String? research;
  final List<String>? coursework;

  /// Official school site (opens in browser; favicon derived when [logoUrl] is null).
  final String? institutionUrl;

  /// Optional bundled logo; otherwise UI may use a favicon from [institutionUrl].
  final String? logoUrl;

  /// When true, logo chip uses a black fill in light theme (light favicons).
  final bool logoChipBlackInLight;

  const Education({
    required this.degree,
    required this.institution,
    required this.period,
    this.level,
    this.major,
    this.research,
    this.coursework,
    this.institutionUrl,
    this.logoUrl,
    this.logoChipBlackInLight = false,
  });

  factory Education.fromFirestore(Map<String, dynamic> data) {
    return Education(
      degree: data['degree'] ?? '',
      level: data['level'] as String?,
      major: data['major'] as String?,
      institution: data['institution'] ?? '',
      period: data['period'] ?? '',
      research: data['research'],
      coursework: data['coursework'] != null
          ? List<String>.from(data['coursework'])
          : null,
      institutionUrl: data['institutionUrl'] as String?,
      logoUrl: data['logoUrl'] as String?,
      logoChipBlackInLight: data['logoChipBlackInLight'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'degree': degree,
      if (level != null && level!.trim().isNotEmpty) 'level': level,
      if (major != null && major!.trim().isNotEmpty) 'major': major,
      'institution': institution,
      'period': period,
      if (research != null) 'research': research,
      if (coursework != null) 'coursework': coursework,
      if (institutionUrl != null) 'institutionUrl': institutionUrl,
      if (logoUrl != null) 'logoUrl': logoUrl,
      if (logoChipBlackInLight) 'logoChipBlackInLight': logoChipBlackInLight,
    };
  }
}
