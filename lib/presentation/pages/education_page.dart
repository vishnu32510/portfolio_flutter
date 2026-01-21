import 'package:flutter/material.dart';
import '../widgets/base_page/base_page.dart';
import '../widgets/body/education/education_section.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      content: EducationSection(),
    );
  }
}
