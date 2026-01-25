import 'package:flutter/material.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../navigation/navigation.dart';

class DeveloperNameBtn extends StatelessWidget {
  const DeveloperNameBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final isCurrentRoute = ModalRoute.of(context)?.settings.name == Routes.home.route;
    
    return MouseRegion(
      cursor: !isCurrentRoute
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => !isCurrentRoute ? null : AppNavigator.goHome(),
        child: Container(
          // Slightly bigger app icon in the app bar
          height: AppSizes.iconXL + 6,
          width: AppSizes.iconXL + 6,
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          child: Hero(
            tag: AppConstants.heroTagAppIcon,
            child: Image.asset(
              AppAssets.appIcon,
              gaplessPlayback: true,
            ),
          ),
        ),
      ),
    );
  }
}
