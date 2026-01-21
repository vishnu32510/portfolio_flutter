class TechnicalSkill {
  final String category;
  final List<String> skills;

  const TechnicalSkill({
    required this.category,
    required this.skills,
  });

  factory TechnicalSkill.fromFirestore(Map<String, dynamic> data) {
    return TechnicalSkill(
      category: data['category'] ?? '',
      skills: List<String>.from(data['skills'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'category': category,
      'skills': skills,
    };
  }
}
