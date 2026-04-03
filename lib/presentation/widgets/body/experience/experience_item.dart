import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/experience_utils.dart';
import '../../../../core/widgets/bounce_animator.dart';
import '../../../../core/widgets/sequential_animator.dart';
import '../../../../core/widgets/timeline_container.dart';
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

  String? _resolveLogoUrl() {
    final e = widget.experience;
    final explicit = e.logoUrl?.trim();
    if (explicit != null && explicit.isNotEmpty) return explicit;
    final site = e.companyUrl?.trim();
    if (site != null && site.isNotEmpty) {
      return ExperienceBrandAssets.faviconForCompanyWebsite(site);
    }
    return null;
  }

  Future<void> _openCompanySite() async {
    final raw = widget.experience.companyUrl?.trim();
    if (raw == null || raw.isEmpty) return;
    final uri = Uri.tryParse(raw);
    if (uri == null) return;
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  IconData _getIconForAchievement(String achievement) {
    final ach = achievement.toLowerCase();
    if (ach.contains('built') || ach.contains('develop')) {
      return FontAwesomeIcons.code;
    }
    if (ach.contains('design') || ach.contains('architect')) {
      return FontAwesomeIcons.penRuler;
    }
    if (ach.contains('optimiz') ||
        ach.contains('improve') ||
        ach.contains('reduce')) {
      return FontAwesomeIcons.gaugeHigh;
    }
    if (ach.contains('integrat') || ach.contains('api')) {
      return FontAwesomeIcons.plug;
    }
    if (ach.contains('test') || ach.contains('coverage')) {
      return FontAwesomeIcons.vial;
    }
    if (ach.contains('deploy') || ach.contains('ci/cd')) {
      return FontAwesomeIcons.rocket;
    }
    if (ach.contains('mentor') || ach.contains('team')) {
      return FontAwesomeIcons.users;
    }
    if (ach.contains('security') || ach.contains('auth')) {
      return FontAwesomeIcons.lock;
    }
    if (ach.contains('analytics') || ach.contains('track')) {
      return FontAwesomeIcons.chartPie;
    }
    if (ach.contains('performance') || ach.contains('speed')) {
      return FontAwesomeIcons.bolt;
    }
    if (ach.contains('consult') ||
        ach.contains('client') ||
        ach.contains('enterprise')) {
      return FontAwesomeIcons.handshake;
    }
    if (ach.contains('agile') || ach.contains('rollout')) {
      return FontAwesomeIcons.timeline;
    }
    return FontAwesomeIcons.circleCheck;
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'internship':
        return const Color(0xFF3B82F6);
      case 'full time':
        return const Color(0xFF22C55E);
      case 'part time':
        return const Color(0xFFF59E0B);
      case 'freelance':
        return const Color(0xFF8B5CF6);
      default:
        return const Color(0xFF22C55E);
    }
  }

  Widget _buildDateChip(ColorScheme colors) {
    return Container(
      decoration: BoxDecoration(
        color: colors.onSurface.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppSizes.iconHuge),
        border: Border.all(color: colors.outline),
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.spacingSmall,
        horizontal: AppSizes.spacingRegular,
      ),
      child: Text(
        ExperienceUtils.convertToTimeline(widget.experience.period),
        style: AppStyles.extraSmallText(),
      ),
    );
  }

  Widget _buildCompanyLine(ColorScheme colors) {
    final style = AppStyles.smallTextBold(
      textColor: _collapsed
          ? colors.onSurface.withValues(alpha: 0.5)
          : colors.primary,
    );
    final url = widget.experience.companyUrl?.trim();
    if (url == null || url.isEmpty) {
      return Text(widget.experience.company, style: style);
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Semantics(
        link: true,
        label: 'Open ${widget.experience.company} website',
        child: InkWell(
          onTap: _openCompanySite,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    widget.experience.company,
                    style: style,
                    maxLines: 4,
                  ),
                ),
                SizedBox(width: AppSizes.spacingSmall),
                Icon(
                  FontAwesomeIcons.arrowUpRightFromSquare,
                  size: 11,
                  color: style.color?.withValues(alpha: 0.72),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(ColorScheme colors) {
    final logoUrl = _resolveLogoUrl();
    if (logoUrl == null) return const SizedBox.shrink();
    final tappable = widget.experience.companyUrl?.trim().isNotEmpty ?? false;

    final image = ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: CachedNetworkImage(
        imageUrl: logoUrl,
        fit: BoxFit.contain,
        placeholder: (context, _) => Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colors.primary.withValues(alpha: 0.45),
            ),
          ),
        ),
        errorWidget: (context, url, _) => Icon(
          Icons.public_outlined,
          size: 20,
          color: colors.onSurface.withValues(alpha: 0.3),
        ),
      ),
    );

    final box = Container(
      width: 44,
      height: 44,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.outline.withValues(alpha: 0.65)),
        color: colors.surface,
      ),
      child: image,
    );

    if (!tappable) {
      return box;
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(onTap: _openCompanySite, child: box),
    );
  }

  Widget _buildTitleBlock(
    ColorScheme colors,
    String experienceType,
    Color typeColor,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.experience.title, style: AppStyles.mediumTextBold()),
        _buildCompanyLine(colors),
        SizedBox(height: AppSizes.spacingSmall),
        Container(
          padding: AppSizes.paddingXS,
          decoration: BoxDecoration(
            borderRadius: AppSizes.borderRadiusXS,
            color: typeColor.withValues(alpha: 0.1),
            border: Border.all(width: 0.3, color: typeColor),
          ),
          child: Text(
            experienceType,
            style: AppStyles.extraSmallText(textColor: typeColor),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(
    ColorScheme colors,
    String experienceType,
    Color typeColor,
  ) {
    final stackDateBelow = context.isMobile || context.width < 700;

    final coreRow = Row(
      crossAxisAlignment: _collapsed
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (_resolveLogoUrl() != null) ...[
          _buildLogo(colors),
          SizedBox(width: AppSizes.spacingMedium),
        ],
        Expanded(child: _buildTitleBlock(colors, experienceType, typeColor)),
      ],
    );

    if (stackDateBelow) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          coreRow,
          SizedBox(height: AppSizes.spacingRegular),
          _buildDateChip(colors),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: coreRow),
        SizedBox(width: AppSizes.spacingRegular),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: _buildDateChip(colors),
        ),
      ],
    );
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
                child: _buildHeader(colors, experienceType, typeColor),
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
                        spacedChildren.add(
                          SizedBox(height: AppSizes.spacingMedium),
                        );
                      }
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: spacedChildren,
                    );
                  },
                  children: widget.experience.achievements.map((achievement) {
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
                            _getIconForAchievement(achievement),
                            size: AppSizes.iconSmall,
                            color: colors.primary,
                          ),
                        ),
                        SizedBox(width: AppSizes.spacingMedium),
                        Expanded(
                          child: Text(
                            achievement,
                            style: AppStyles.regularText(),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
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
                            Text(
                              'Collapse',
                              style: AppStyles.smallText(
                                textColor: colors.onSurface.withValues(
                                  alpha: 0.5,
                                ),
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
