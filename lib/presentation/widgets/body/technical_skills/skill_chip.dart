import 'package:flutter/material.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';

class SkillChip extends StatelessWidget {
  const SkillChip({
    super.key,
    required this.skillName,
    this.compact = false,
  });

  final String skillName;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.1),
        borderRadius: compact ? AppSizes.borderRadiusXS : AppSizes.borderRadiusSmall,
        border: Border.all(
          width: 0.3,
          color: colors.primary,
        ),
      ),
      padding: compact
          ? AppSizes.paddingXS
          : EdgeInsets.symmetric(
              horizontal: AppSizes.spacingSmallRegular,
              vertical: AppSizes.spacingXS,
            ),
      child: SelectableText(
        skillName,
        style: compact
            ? AppStyles.extraSmallTextThin(
                textColor: colors.primary,
              )
            : AppStyles.smallTextThin(
                textColor: colors.primary,
              ),
      ),
    );
  }
}
