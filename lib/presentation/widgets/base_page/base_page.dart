import 'package:flutter/material.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/widgets/particle_network_background.dart';
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
            // Use RepaintBoundary to isolate background rendering and improve performance
            Positioned.fill(
              child: RepaintBoundary(
                child: ParticleNetworkBackground(
                  particleCount: 40, // Reduced for better performance
                  maxSpeed: 0.3, // Slightly faster for smoother animation
                  maxSize: 1.5,
                  lineWidth: 0.5,
                  lineDistance: 200, // Increased distance = fewer connections = better performance
                  touchActivation: true,
                  drawNetwork: true,
                  fill: false,
                  isComplex: false, // Set to false for better performance
                ),
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
