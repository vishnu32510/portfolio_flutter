import 'package:flutter/material.dart';
import '../widgets/base_page/base_page.dart';
import '../widgets/body/intro/intro_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      content: IntroSection(),
    );
  }
}
