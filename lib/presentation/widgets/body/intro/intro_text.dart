import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final data = portfolioState.data;
        if (data == null) {
          return const Center(child: CircularProgressIndicator());
        }

        // Multiple roles to cycle through
        final List<String> roles = [
          data.developerTitle,
          'Full-stack Mobile Engineer',
          'Flutter Developer',
          'Cross-platform Expert',
          'Mobile & Web Developer',
          'Software Engineer',
        ];

        return Column(
          crossAxisAlignment: context.width < DeviceType.mobile.getMaxWidth()
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            SelectableText(
              data.developerName,
              style: context.width < DeviceType.ipad.getMaxWidth()
                  ? AppStyles.s28
                  : AppStyles.s52,
              textAlign: _getTextAlign(context.width),
            ),
            const SizedBox(height: 8),
            // Animated typewriter text for multiple roles
            SizedBox(
              height: context.width < DeviceType.ipad.getMaxWidth() ? 24 : 28,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1500),
                    animatedTexts: roles.map((role) {
                      return TypewriterAnimatedText(
                        role,
                        textStyle: context.width < DeviceType.ipad.getMaxWidth()
                            ? AppStyles.s16
                            : AppStyles.s18,
                        textAlign: _getTextAlign(context.width),
                        speed: const Duration(milliseconds: 50),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: context.width < DeviceType.mobile.getMaxWidth()
                  ? context.width - 20
                  : context.width / 1.5,
              child: SelectableText(
                data.introMessage,
                style: context.width < DeviceType.ipad.getMaxWidth()
                    ? AppStyles.s14
                    : AppStyles.s16,
                textAlign: _getTextAlign(context.width),
              ),
            ),
          ],
        );
      },
    );
  }

  TextAlign _getTextAlign(double screenWidth) {
    return screenWidth < DeviceType.mobile.getMaxWidth()
        ? TextAlign.center
        : TextAlign.start;
  }
}
