import 'package:flutter/material.dart';
import '../../../core/widgets/grid_background.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import 'global_footer.dart';
import '../app_bar/home_app_bar.dart';

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: const HomeAppBar(),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            Positioned.fill(
              child: GridBackground(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
                strokeWidth: 0.5,
                horizontalSpacing: 45,
                verticalSpacing: 45,
                runnerColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            if (additionalBackground != null) additionalBackground!,
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    alignment: singlePageContent
                        ? Alignment.center
                        : Alignment.topCenter,
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
          ],
        ),
      ),
    );
  }
}
