import 'package:equatable/equatable.dart';
import 'education.dart';
import 'experience.dart';
import 'project.dart';
import 'technical_skill.dart';

class PortfolioData extends Equatable {
  final String developerName;
  final String developerTitle;
  final String introMessage;
  final String resumeLink;
  final Map<String, String> socialLinks;
  final List<TechnicalSkill> technicalSkills;
  final List<Experience> experiences;
  final List<Project> projects;
  final List<Education> education;

  const PortfolioData({
    required this.developerName,
    required this.developerTitle,
    required this.introMessage,
    required this.resumeLink,
    required this.socialLinks,
    required this.technicalSkills,
    required this.experiences,
    required this.projects,
    required this.education,
  });

  factory PortfolioData.fromFirestore(Map<String, dynamic> data) {
    return PortfolioData(
      developerName: data['developerName'] ?? '',
      developerTitle: data['developerTitle'] ?? '',
      introMessage: data['introMessage'] ?? '',
      resumeLink: data['resumeLink'] ?? '',
      socialLinks: Map<String, String>.from(data['socialLinks'] ?? {}),
      technicalSkills: (data['technicalSkills'] as List<dynamic>?)
              ?.map((e) => TechnicalSkill.fromFirestore(e as Map<String, dynamic>))
              .toList() ??
          [],
      experiences: (data['experiences'] as List<dynamic>?)
              ?.map((e) => Experience.fromFirestore(e as Map<String, dynamic>))
              .toList() ??
          [],
      projects: (data['projects'] as List<dynamic>?)
              ?.map((e) => Project.fromFirestore(e as Map<String, dynamic>))
              .toList() ??
          [],
      education: (data['education'] as List<dynamic>?)
              ?.map((e) => Education.fromFirestore(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [
        developerName,
        developerTitle,
        introMessage,
        resumeLink,
        socialLinks,
        technicalSkills,
        experiences,
        projects,
        education,
      ];
}
