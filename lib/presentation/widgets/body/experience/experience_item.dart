import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/experience_utils.dart';
import '../../../../core/widgets/sequential_animator.dart';
import '../../../../core/widgets/timeline_container.dart';
import '../../../../core/widgets/bounce_animator.dart';
import '../../../../data/models/experience.dart';

class ExperienceItem extends StatefulWidget {
  const ExperienceItem({
    super.key,
    required this.experience,
    this.collapsed = true,
  });

  final Experience experience;
  final bool collapsed;

  @override
  State<ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  bool _collapsed = false;

  @override
  void initState() {
    _collapsed = widget.collapsed;
    super.initState();
  }

  IconData _getIconForAchievement(String achievement, int index) {
    final ach = achievement.toLowerCase();
    if (ach.contains('built') || ach.contains('develop')) return FontAwesomeIcons.code;
    if (ach.contains('design') || ach.contains('architect')) return FontAwesomeIcons.penRuler;
    if (ach.contains('optimiz') || ach.contains('improve') || ach.contains('reduce')) return FontAwesomeIcons.gaugeHigh;
    if (ach.contains('integrat') || ach.contains('api')) return FontAwesomeIcons.plug;
    if (ach.contains('test') || ach.contains('coverage')) return FontAwesomeIcons.vial;
    if (ach.contains('deploy') || ach.contains('ci/cd')) return FontAwesomeIcons.rocket;
    if (ach.contains('mentor') || ach.contains('team')) return FontAwesomeIcons.users;
    if (ach.contains('security') || ach.contains('auth')) return FontAwesomeIcons.lock;
    if (ach.contains('analytics') || ach.contains('track')) return FontAwesomeIcons.chartPie;
    if (ach.contains('performance') || ach.contains('speed')) return FontAwesomeIcons.bolt;
    return FontAwesomeIcons.circleCheck;
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'internship':
        return const Color(0xFF3B82F6); // blue600
      case 'full time':
        return const Color(0xFF22C55E); // green500
      case 'part time':
        return const Color(0xFFF59E0B); // amber500
      case 'freelance':
        return const Color(0xFF8B5CF6); // purple500
      default:
        return const Color(0xFF22C55E); // green500
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isPresent = ExperienceUtils.isPresent(widget.experience.period);
    final experienceType = ExperienceUtils.getExperienceType(
      widget.experience.title,
      widget.experience.company,
    );
    final typeColor = _getTypeColor(experienceType);

    return MouseRegion(
      cursor: _collapsed ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: _collapsed ? () => setState(() => _collapsed = false) : null,
        child: TimelineContainer(
          present: isPresent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.spaceBetween,
                  runSpacing: AppSizes.spacingRegular,
                  spacing: AppSizes.spacingRegular,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: _collapsed
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          padding: _collapsed
                              ? EdgeInsets.zero
                              : AppSizes.paddingMedium,
                          decoration: BoxDecoration(
                            color: _collapsed
                                ? Colors.transparent
                                : colors.onSurface.withValues(alpha: 0.05),
                            borderRadius: AppSizes.borderRadiusSmall,
                            border: _collapsed
                                ? null
                                : Border.all(color: colors.outline),
                          ),
                          child: Icon(
                            _collapsed
                                ? FontAwesomeIcons.chevronRight
                                : FontAwesomeIcons.briefcase,
                            size: _collapsed
                                ? AppSizes.iconRegular
                                : AppSizes.iconMedium,
                            color: _collapsed
                                ? colors.onSurface.withValues(alpha: 0.5)
                                : colors.primary,
                          ),
                        ),
                        SizedBox(width: AppSizes.spacingLarge),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SelectableText(
                                widget.experience.title,
                                style: AppStyles.mediumTextBold(),
                              ),
                              SelectableText(
                                widget.experience.company,
                                style: AppStyles.smallTextBold(
                                  textColor: _collapsed
                                      ? colors.onSurface.withValues(alpha: 0.5)
                                      : colors.primary,
                                ),
                              ),
                              SizedBox(height: AppSizes.spacingSmall),
                              Container(
                                padding: AppSizes.paddingXS,
                                decoration: BoxDecoration(
                                  borderRadius: AppSizes.borderRadiusXS,
                                  color: typeColor.withValues(alpha: 0.1),
                                  border: Border.all(
                                    width: 0.3,
                                    color: typeColor,
                                  ),
                                ),
                                child: SelectableText(
                                  experienceType,
                                  style: AppStyles.extraSmallText(
                                    textColor: typeColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: colors.onSurface.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(AppSizes.iconHuge),
                        border: Border.all(color: colors.outline),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.spacingSmall,
                        horizontal: AppSizes.spacingRegular,
                      ),
                      child: SelectableText(
                        ExperienceUtils.convertToTimeline(widget.experience.period),
                        style: AppStyles.extraSmallText(),
                      ),
                    ),
                  ],
                ),
              ),
              if (!_collapsed) ...[
                SizedBox(height: AppSizes.spacingLarge),
                SequentialAnimator(
                  itemDuration: const Duration(milliseconds: 200),
                  curve: Curves.bounceInOut,
                  animationBuilder: (child, animation) => FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                    child: child,
                  ),
                  builder: (children) {
                    final spacedChildren = <Widget>[];
                    for (int i = 0; i < children.length; i++) {
                      spacedChildren.add(children[i]);
                      if (i < children.length - 1) {
                        spacedChildren.add(SizedBox(height: AppSizes.spacingMedium));
                      }
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: spacedChildren,
                    );
                  },
                  children: widget.experience.achievements.map(
                    (achievement) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Baseline(
                            baseline: AppStyles.regularText().fontSize ?? 14,
                            baselineType: TextBaseline.alphabetic,
                            child: Icon(
                              _getIconForAchievement(achievement, 0),
                              size: AppSizes.iconSmall,
                              color: colors.primary,
                            ),
                          ),
                          SizedBox(width: AppSizes.spacingMedium),
                          Expanded(
                            child: SelectableText(
                              achievement,
                              style: AppStyles.regularText(),
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ],
              // Collapse button if it was initially collapsed
              if (!_collapsed && widget.collapsed) ...[
                SizedBox(height: AppSizes.spacingMedium),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => setState(() => _collapsed = true),
                      child: BounceAnimator(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FontAwesomeIcons.chevronUp,
                              size: AppSizes.iconSmall,
                              color: colors.onSurface.withValues(alpha: 0.5),
                            ),
                            SelectableText(
                              'Collapse',
                              style: AppStyles.smallText(
                                textColor: colors.onSurface.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
