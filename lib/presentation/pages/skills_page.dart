import 'package:flutter/material.dart';
import '../widgets/base_page/base_page.dart';
import '../widgets/body/technical_skills/technical_skills_section.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      content: TechnicalSkillsSection(),
    );
  }
}
