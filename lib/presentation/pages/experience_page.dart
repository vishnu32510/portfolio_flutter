import 'package:flutter/material.dart';
import '../widgets/base_page/base_page.dart';
import '../widgets/body/experience/experience_section.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      content: ExperienceSection(),
    );
  }
}
