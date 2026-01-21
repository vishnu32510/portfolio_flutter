import 'package:flutter/material.dart';
import '../utils/app_extensions.dart';
import '../utils/app_styles.dart';

class Subtext extends StatelessWidget {
  const Subtext(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * (context.isMobile ? 0.9 : 0.6),
      constraints: const BoxConstraints(
        minWidth: 400,
      ),
      child: SelectableText(
        text,
        style: AppStyles.subText(
          isMobile: context.isMobile,
          textColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
