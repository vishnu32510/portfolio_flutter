import 'package:flutter/material.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/async_background_stack.dart';
import '../app_bar/home_app_bar.dart';
import '../app_bar/resume_theme_widget.dart';
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
    final isCompactWidth = context.width < 800;
    
    // Scaffold created per page (after route is established, so Overlay is available)
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: const HomeAppBar(), // Builder inside ensures Overlay access
      floatingActionButton: context.isMobile || isCompactWidth
          ? ResumeThemeWidget()
          : null,
      body: Stack(
        children: [
          // Persistent background shared across all pages
          Positioned.fill(
            child: AsyncBackgroundStack(
              showParticleNetwork: true,
              showGrid: true,
              particleCount: (MediaQuery.of(context).size.width / 20)
                  .clamp(30, 100)
                  .toInt(),
              particleMaxSpeed: 0.5,
              particleLineDistance: 150,
              touchActivation: false,
            ),
          ),
          // Content
          Positioned.fill(
            child: SizedBox(
              height: context.height,
              width: context.width,
              child: CustomScrollView(
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
            ),
          ),
        ],
      ),
    );
  }
}
