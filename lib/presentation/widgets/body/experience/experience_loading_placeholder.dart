import 'package:flutter/material.dart';

import '../../../../core/utils/app_sizes.dart';

/// Shown while experience data is loading; mirrors card density of [ExperienceItem].
class ExperienceLoadingPlaceholder extends StatelessWidget {
  const ExperienceLoadingPlaceholder({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    Widget bar(double width, double height) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: colors.onSurface.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == itemCount - 1 ? 0 : AppSizes.spacingLarge,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: AppSizes.borderRadiusRegular,
              border: Border.all(
                color: colors.outline.withValues(alpha: 0.45),
              ),
              color: colors.surface.withValues(alpha: 0.65),
            ),
            padding: AppSizes.paddingLarge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    bar(36, 36),
                    SizedBox(width: AppSizes.spacingLarge),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          bar(160, 14),
                          SizedBox(height: AppSizes.spacingSmall),
                          bar(220, 12),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spacingMedium),
                bar(130, 22),
              ],
            ),
          ),
        );
      }),
    );
  }
}
