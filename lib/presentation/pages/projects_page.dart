import 'package:flutter/material.dart';
import '../widgets/base_page/base_page.dart';
import '../widgets/body/projects/projects_section.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      content: ProjectsSection(),
    );
  }
}
