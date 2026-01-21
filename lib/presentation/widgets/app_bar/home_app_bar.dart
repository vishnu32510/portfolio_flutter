import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../navigation/navigation.dart';
import 'custom_menu_btn.dart';
import 'developer_name_btn.dart';
import 'horizontal_headers.dart';
import 'web_options.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: AppSizes.spacingMedium,
          horizontal: AppSizes.spacingRegular,
        ),
        padding: AppSizes.paddingRegular,
        child: Stack(
          children: [
            // Left: Developer Name/Logo (no delay)
            Align(
              alignment: Alignment.centerLeft,
              child: MouseRegion(
                cursor: ModalRoute.of(context)?.settings.name == Routes.home.route
                    ? SystemMouseCursors.basic
                    : SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => AppNavigator.goHome(),
                  child: const DeveloperNameBtn(),
                ),
              ),
            ),
            // Center: Navigation Headers (desktop only) - with delay
            if (!context.isMobile && context.width >= 800)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: context.width * 0.8,
                  child: DelayedDisplay(
                    slidingCurve: Curves.fastEaseInToSlowEaseOut,
                    delay: const Duration(milliseconds: 350),
                    child: const HorizontalHeaders(),
                  ),
                ),
              ),
            // Right: Web Options (Resume + Theme) or Mobile Menu - with delay
            Align(
              alignment: Alignment.centerRight,
              child: DelayedDisplay(
                slidingCurve: Curves.fastEaseInToSlowEaseOut,
                delay: const Duration(milliseconds: 350),
                child: context.isMobile || context.width < 800
                    ? const CustomMenuBtn()
                    : const WebOptions(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
