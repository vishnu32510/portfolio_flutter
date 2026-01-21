import 'package:flutter/material.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';

enum ProjectTag {
  all('All'),
  mobile('Mobile'),
  web('Web'),
  ai('AI'),
  backend('Backend');

  final String value;
  const ProjectTag(this.value);
}

class ProjectTagSelector extends StatelessWidget {
  const ProjectTagSelector({
    super.key,
    required this.selectedTag,
    required this.onChanged,
  });

  final ProjectTag selectedTag;
  final Function(ProjectTag) onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: context.width * 0.9,
      constraints: const BoxConstraints(minWidth: 400),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: AppSizes.spacingMedium,
        runSpacing: AppSizes.spacingMedium,
        children: ProjectTag.values.map(
          (tag) => MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => onChanged(tag),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  borderRadius: selectedTag == tag
                      ? AppSizes.borderRadiusRegular
                      : AppSizes.borderRadiusSmall,
                  border: selectedTag == tag
                      ? null
                      : Border.all(color: colors.outline),
                  color: selectedTag == tag
                      ? colors.primary
                      : colors.surface.withValues(alpha: 0.8),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.spacingRegular,
                  vertical: AppSizes.spacingSmall,
                ),
                child: Text(
                  tag.value,
                  style: selectedTag == tag
                      ? AppStyles.smallTextBold(textColor: colors.onPrimary)
                      : AppStyles.smallText(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ).toList(),
      ),
    );
  }
}
