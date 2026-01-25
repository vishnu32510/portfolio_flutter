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
              child: const DeveloperNameBtn(),
            ),
            // Center: Navigation Headers (desktop only)
            if (!context.isMobile && context.width >= 800)
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: context.width * 0.8,
                  child: const HorizontalHeaders(),
                ),
              ),
            // Right: Web Options (Resume + Theme) or Mobile Menu
            // Align(
            //   alignment: Alignment.centerRight,
            //   child:const WebOptions(),
            // ),
            Align(
              alignment: Alignment.centerRight,
              child: context.isMobile || context.width < 800
                  ? const CustomMenuBtn()
                  : const WebOptions(),
            ),
          ],
        ),
      ),
    );
  }
}
