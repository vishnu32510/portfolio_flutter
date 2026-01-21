import 'package:flutter/material.dart';
import '../utils/app_extensions.dart';
import '../utils/app_sizes.dart';

class TimelineContainer extends StatelessWidget {
  const TimelineContainer({
    super.key,
    required this.child,
    this.showContainer = true,
    this.present = false,
  });

  final Widget child;
  final bool present;
  final bool showContainer;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: context.width * (context.isMobile ? 0.9 : 0.6),
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: colors.outline,
            width: 1.5,
          ),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (showContainer)
            TimelineIndicator(
              present: present,
            ),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: showContainer ? AppSizes.spacingRegular : AppSizes.spacingXL,
                bottom: showContainer ? AppSizes.spacingRegular : AppSizes.spacingSmall,
                left: context.isMobile ? AppSizes.spacingXL : AppSizes.spacingXXL,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: showContainer ? AppSizes.spacingLarge : AppSizes.spacingSmall,
                vertical: showContainer ? AppSizes.spacingLarge : AppSizes.spacingSmall,
              ),
              decoration: showContainer
                  ? BoxDecoration(
                      borderRadius: AppSizes.borderRadiusRegular,
                      border: Border.all(color: colors.outline),
                      color: colors.surface,
                    )
                  : null,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineIndicator extends StatelessWidget {
  const TimelineIndicator({super.key, this.present = false});

  final bool present;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    double size = AppSizes.iconXXS;

    if (present) {
      size = AppSizes.iconXS;
    }

    return Positioned(
      left: -(size / 1.7),
      top: AppSizes.spacingXL,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: present ? colors.surface : colors.onSurface.withValues(alpha: 0.5),
          boxShadow: present
              ? [
                  BoxShadow(
                    color: Colors.green.withValues(alpha: 0.5),
                    spreadRadius: 2.5,
                    blurRadius: 4,
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: present
            ? Container(
                height: size / 2,
                width: size / 2,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              )
            : null,
      ),
    );
  }
}
