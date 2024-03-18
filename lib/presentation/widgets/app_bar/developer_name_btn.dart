import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/app_styles.dart';

class DeveloperNameBtn extends StatelessWidget {
  const DeveloperNameBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        kIsWeb ? html.window.location.reload() : null;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        width: context.width < DeviceType.ipad.getMaxWidth()
            ? context.width * .4
            : context.width * .15,
        child: Row(
          children: [
            Image.asset(
              AppAssets.appIcon,
              gaplessPlayback: true,
              repeat: ImageRepeat.repeat,
            ),
            const SizedBox(
              width: 10,
            ),
            FittedBox(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Text(
                    AppStrings.developerNameStyle,
                    textScaler: const TextScaler.linear(1.2),
                    style: AppStyles.italic,
                  ),
                  Text(
                    AppStrings.developerFlutterGeek,
                    textScaler: const TextScaler.linear(0.8),
                    style: AppStyles.italic,
                  ),
                ],
              ),
            ),
            // Lottie.asset(
            //   AppAssets.firebaseFlutterLogoLottie,
            //   repeat: true,
            // )
          ],
        ),
      ),
    );
  }
}
