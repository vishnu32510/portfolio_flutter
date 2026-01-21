class Education {
  final String degree;
  final String institution;
  final String period;
  final String? research;
  final List<String>? coursework;

  const Education({
    required this.degree,
    required this.institution,
    required this.period,
    this.research,
    this.coursework,
  });

  factory Education.fromFirestore(Map<String, dynamic> data) {
    return Education(
      degree: data['degree'] ?? '',
      institution: data['institution'] ?? '',
      period: data['period'] ?? '',
      research: data['research'],
      coursework: data['coursework'] != null
          ? List<String>.from(data['coursework'])
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'degree': degree,
      'institution': institution,
      'period': period,
      if (research != null) 'research': research,
      if (coursework != null) 'coursework': coursework,
    };
  }
}
