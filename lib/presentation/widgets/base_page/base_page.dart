import 'package:flutter/material.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import 'global_footer.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.content,
    this.additionalBackground,
    this.singlePageContent = false,
  });

  final Widget content;
  final bool singlePageContent;
  final Widget? additionalBackground;


  @override
  Widget build(BuildContext context) {
    // Scaffold and Background are now handled by MainWrapper
    return SizedBox(
      height: context.height,
      width: context.width,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              alignment: singlePageContent ? Alignment.center : Alignment.topCenter,
              padding: EdgeInsets.only(
                top: AppConstants.appBarHeight,
              ),
              constraints: BoxConstraints(
                minHeight: context.height,
              ),
              child: content,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppSizes.spacingXXL),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: const GlobalFooter(),
          ),
        ],
      ),
    );
  }
}
