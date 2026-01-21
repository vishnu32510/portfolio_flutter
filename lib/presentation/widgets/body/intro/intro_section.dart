import 'package:flutter/material.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import 'intro_text.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.08,
        horizontal: context.width < 800 ? AppSizes.spacingRegular : 0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width * 0.9),
          child: const IntroText(),
        ),
      ),
    );
  }
}
