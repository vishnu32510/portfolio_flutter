class Experience {
  final String title;
  final String company;
  final String period;
  final List<String> achievements;

  const Experience({
    required this.title,
    required this.company,
    required this.period,
    required this.achievements,
  });

  factory Experience.fromFirestore(Map<String, dynamic> data) {
    return Experience(
      title: data['title'] ?? '',
      company: data['company'] ?? '',
      period: data['period'] ?? '',
      achievements: List<String>.from(data['achievements'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'company': company,
      'period': period,
      'achievements': achievements,
    };
  }
}
