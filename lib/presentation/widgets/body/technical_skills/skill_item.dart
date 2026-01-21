import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/sequential_animator.dart';
import '../../../../data/models/technical_skill.dart';
import 'skill_chip.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({super.key, required this.skillGroup});

  final TechnicalSkill skillGroup;

  IconData _getIconForCategory(String category) {
    final cat = category.toLowerCase();
    if (cat.contains('language')) return FontAwesomeIcons.code;
    if (cat.contains('mobile') || cat.contains('frontend')) return FontAwesomeIcons.mobileScreenButton;
    if (cat.contains('backend')) return FontAwesomeIcons.server;
    if (cat.contains('tool') || cat.contains('devops')) return FontAwesomeIcons.screwdriverWrench;
    return FontAwesomeIcons.gear;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final icon = _getIconForCategory(skillGroup.category);

    return Container(
      width: context.isMobile ? context.width : context.width / 4,
      constraints: const BoxConstraints(minWidth: 250),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppSizes.borderRadiusRegular,
        border: Border.all(color: colors.outline),
      ),
      padding: AppSizes.paddingLarge,
      child: Stack(
        children: [
          _randomlyPositionedIcon(colors, icon),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: colors.primary,
                    size: AppSizes.iconMedium,
                  ),
                  SizedBox(width: AppSizes.spacingMedium),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SelectableText(
                      skillGroup.category,
                      style: AppStyles.mediumTextBold(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.spacingLarge),
              Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: colors.outline,
                ),
              ),
              SizedBox(height: AppSizes.spacingLarge),
              SequentialAnimator(
                delay: const Duration(milliseconds: 400),
                itemDuration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut,
                animationBuilder: (child, animation) => ScaleTransition(
                  scale: Tween<double>(begin: 0, end: 1).animate(animation),
                  child: child,
                ),
                builder: (children) => Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: AppSizes.spacingMediumSmall,
                  runSpacing: AppSizes.spacingMediumSmall,
                  children: children,
                ),
                children: skillGroup.skills
                    .map((skill) => SkillChip(skillName: skill))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Positioned _randomlyPositionedIcon(ColorScheme colors, IconData icon) {
    final r = Random(skillGroup.category.hashCode);
    double v() => 5 + r.nextDouble() * 10;
    final useTop = r.nextBool();
    return Positioned(
      top: useTop ? v() : null,
      bottom: useTop ? null : v(),
      right: v(),
      child: Icon(
        icon,
        size: AppSizes.iconHuge,
        color: colors.primary.withValues(alpha: 0.3),
      ),
    );
  }
}
