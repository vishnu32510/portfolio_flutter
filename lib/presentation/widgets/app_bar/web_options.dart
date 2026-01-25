import 'package:flutter/material.dart';
import '../../../core/utils/app_extensions.dart';
import 'resume_theme_widget.dart';

class WebOptions extends StatelessWidget {
  const WebOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompactWidth = context.width < 800;

    if (context.isMobile || isCompactWidth) {
      return const SizedBox.shrink();
    }

    return const ResumeThemeWidget();
  }
}
