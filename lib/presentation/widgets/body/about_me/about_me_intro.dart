import 'package:flutter/material.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';

class AboutMeIntro extends StatelessWidget {
  const AboutMeIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: SelectableText(
            'About Me',
            style: AppStyles.s32,
          ),
        ),
        const SizedBox(height: 8),
        SelectableText(
          AppStrings.aboutMeMsg,
          style: context.width < DeviceType.mobile.getMaxWidth()
              ? AppStyles.s14
              : AppStyles.s18,
        ),
      ],
    );
  }
}
