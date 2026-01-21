import 'package:flutter/material.dart';
import '../widgets/base_page/base_page.dart';
import '../widgets/body/about_me/about_me_section.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      content: AboutMeSection(),
    );
  }
}
