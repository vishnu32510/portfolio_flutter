import 'package:flutter/material.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import 'home_interactive_avatar.dart';
import 'intro_text.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isMobile || context.width < 960;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height * (isMobile ? 0.04 : 0.06),
        horizontal: context.width < 800 ? AppSizes.spacingRegular : 0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width * 0.92),
          child: isMobile
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    HomeInteractiveAvatar(),
                    SizedBox(height: AppSizes.spacingLarge),
                    IntroText(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(flex: 6, child: IntroText()),
                    const SizedBox(width: AppSizes.spacingXL),
                    Flexible(
                      flex: 4,
                      child: Transform.translate(
                        offset: const Offset(0, -28),
                        child: const HomeInteractiveAvatar(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
