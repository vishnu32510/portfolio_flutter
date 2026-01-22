import '../models/education.dart';

class EducationData {
  static List<Education> getEducation() {
    return const [
      Education(
        degree: 'Master of Science in Computer Science',
        institution: 'Illinois Institute of Technology, Chicago, IL, US',
        period: 'JAN 2024 - DEC 2025',
        research: null,
        coursework: ['Machine Learning', 'Computer Vision', 'Operating Systems', 'Data Structures & Algorithms', 'Big Data Technology'],
      ),
      Education(
        degree: 'Bachelor of Technology, Electronics and Communication Engineering',
        institution: 'Amrita Vishwa Vidhyapeetham, Coimbatore, Tamil Nadu, India',
        period: 'JUL 2017 - JUN 2021',
        research: null,
        coursework: null,
      ),
    ];
  }
}
