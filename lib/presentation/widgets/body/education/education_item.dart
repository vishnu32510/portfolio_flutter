import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/experience_utils.dart';
import '../../../../core/utils/favicon_utils.dart';
import '../../../../core/widgets/brand_favicon_chip.dart';
import '../../../../core/widgets/sequential_animator.dart';
import '../../../../core/widgets/timeline_container.dart';
import '../../../../data/models/education.dart';
import '../technical_skills/skill_chip.dart';

class EducationItem extends StatelessWidget {
  final Education education;
  final bool isLast;

  const EducationItem({
    super.key,
    required this.education,
    this.isLast = false,
  });

  String? _resolveSchoolLogo() {
    final explicit = education.logoUrl?.trim();
    if (explicit != null && explicit.isNotEmpty) return explicit;
    final site = education.institutionUrl?.trim();
    if (site != null && site.isNotEmpty) {
      return FaviconUtils.urlForWebsite(site);
    }
    return null;
  }

  bool get _useStructuredLines {
    final l = education.level?.trim();
    final m = education.major?.trim();
    return l != null && l.isNotEmpty && m != null && m.isNotEmpty;
  }

  Future<void> _openInstitutionSite() async {
    final raw = education.institutionUrl?.trim();
    if (raw == null || raw.isEmpty) return;
    final uri = Uri.tryParse(raw);
    if (uri == null) return;
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildInstitutionLine(ColorScheme colors) {
    final name = education.institution;
    final url = education.institutionUrl?.trim();
    final linkStyle = AppStyles.smallTextBold(textColor: colors.primary);

    if (url == null || url.isEmpty) {
      return SelectableText(name, style: linkStyle);
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Semantics(
        link: true,
        label: 'Open $name website',
        child: InkWell(
          onTap: _openInstitutionSite,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Text(name, style: linkStyle, maxLines: 4)),
                SizedBox(width: AppSizes.spacingSmall),
                Icon(
                  FontAwesomeIcons.arrowUpRightFromSquare,
                  size: 11,
                  color: linkStyle.color?.withValues(alpha: 0.72),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSchoolLeading(ColorScheme colors, Brightness brightness) {
    final logoRef = _resolveSchoolLogo();
    if (logoRef != null) {
      final chipBackgroundBlack =
          education.logoChipBlackInLight && brightness == Brightness.light;
      return BrandFaviconChip(
        logoRef: logoRef,
        linkUrl: education.institutionUrl?.trim(),
        chipBackgroundBlack: chipBackgroundBlack,
        colors: colors,
      );
    }
    return Container(
      padding: AppSizes.paddingMedium,
      decoration: BoxDecoration(
        color: colors.onSurface.withValues(alpha: 0.05),
        borderRadius: AppSizes.borderRadiusSmall,
        border: Border.all(color: colors.outline),
      ),
      child: Icon(
        FontAwesomeIcons.graduationCap,
        size: AppSizes.iconMedium,
        color: colors.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final brightness = theme.brightness;
    final isPresent = ExperienceUtils.isPresent(education.period);

    return TimelineContainer(
      present: isLast && isPresent,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildSchoolLeading(colors, brightness),
                    SizedBox(width: AppSizes.spacingLarge),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: _useStructuredLines
                            ? [
                                SelectableText(
                                  education.level!.trim(),
                                  style: AppStyles.mediumTextBold(),
                                ),
                                SizedBox(height: AppSizes.spacingSmall),
                                SelectableText(
                                  education.major!.trim(),
                                  style: AppStyles.smallTextBold(
                                    textColor: colors.onSurface.withValues(
                                      alpha: 0.88,
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSizes.spacingSmall),
                                _buildInstitutionLine(colors),
                              ]
                            : [
                                SelectableText(
                                  education.degree,
                                  style: AppStyles.mediumTextBold(),
                                ),
                                SizedBox(height: AppSizes.spacingSmall),
                                _buildInstitutionLine(colors),
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
                    ExperienceUtils.convertToTimeline(education.period),
                    style: AppStyles.extraSmallText(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSizes.spacingLarge),
          if (education.research != null) ...[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Baseline(
                  baseline: AppStyles.regularText().fontSize ?? 14,
                  baselineType: TextBaseline.alphabetic,
                  child: Icon(
                    FontAwesomeIcons.microscope,
                    size: AppSizes.iconSmall,
                    color: colors.primary,
                  ),
                ),
                SizedBox(width: AppSizes.spacingMedium),
                Expanded(
                  child: SelectableText(
                    education.research!,
                    style: AppStyles.regularText(),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.spacingMedium),
          ],
          if (education.coursework != null &&
              education.coursework!.isNotEmpty) ...[
            SelectableText(
              'Key Coursework:',
              style: AppStyles.smallTextBold(
                textColor: colors.onSurface.withValues(alpha: 0.8),
              ),
            ),
            SizedBox(height: AppSizes.spacingSmall),
            SequentialAnimator(
              delay: const Duration(milliseconds: 400),
              itemDuration: const Duration(milliseconds: 200),
              curve: Curves.bounceInOut,
              animationBuilder: (child, animation) => ScaleTransition(
                scale: Tween<double>(begin: 0, end: 1).animate(animation),
                child: child,
              ),
              builder: (children) {
                final spacedChildren = <Widget>[];
                for (int i = 0; i < children.length; i++) {
                  spacedChildren.add(children[i]);
                  if (i < children.length - 1) {
                    spacedChildren.add(
                      SizedBox(
                        width: AppSizes.spacingMediumSmall,
                        height: AppSizes.spacingMediumSmall,
                      ),
                    );
                  }
                }
                return Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: AppSizes.spacingMediumSmall,
                  runSpacing: AppSizes.spacingMediumSmall,
                  children: spacedChildren,
                );
              },
              children: education.coursework!
                  .map((course) => SkillChip(skillName: course, compact: true))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
