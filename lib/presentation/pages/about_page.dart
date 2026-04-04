import 'package:flutter/material.dart';

import '../../core/utils/app_sizes.dart';
import '../widgets/base_page/base_page.dart';
import '../widgets/body/about_me/about_me_section.dart';
import '../widgets/body/contact/contact_section.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AboutMeSection(),
          SizedBox(height: AppSizes.spacingXXL),
          ContactSection(),
        ],
      ),
    );
  }
}
