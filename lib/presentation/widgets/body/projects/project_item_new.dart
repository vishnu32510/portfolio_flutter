import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/sequential_animator.dart';
import '../../../../data/models/project.dart';
import '../technical_skills/skill_chip.dart';

class ProjectItemNew extends StatefulWidget {
  const ProjectItemNew({super.key, required this.project});

  final Project project;

  @override
  State<ProjectItemNew> createState() => _ProjectItemNewState();
}

class _ProjectItemNewState extends State<ProjectItemNew> {
  bool _isHovered = false;

  Color _getStatusColor(String? status) {
    if (status == null) return Colors.green;
    final lowerStatus = status.toLowerCase();
    if (lowerStatus.contains('progress')) return Colors.amber;
    if (lowerStatus.contains('completed') || lowerStatus.contains('done')) {
      return Colors.green;
    }
    if (lowerStatus.contains('hold') || lowerStatus.contains('paused')) {
      return Colors.orange;
    }
    return Colors.purple;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final height = context.height / (context.isMobile ? 2 : 2.5);
    final minHeight = max<double>(height, 380.0);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height,
        width: context.isMobile ? context.width * 0.8 : context.width / 5,
        transform: Matrix4.diagonal3Values(
          _isHovered ? 1.02 : 1.0,
          _isHovered ? 1.02 : 1.0,
          1.0,
        ),
        constraints: const BoxConstraints(
          minHeight: 380,
          minWidth: 350,
          maxHeight: 500,
        ),
        decoration: BoxDecoration(
          borderRadius: AppSizes.borderRadiusRegular,
          border: Border.all(
            color: _isHovered
                ? colors.primary.withValues(alpha: 0.5)
                : colors.outline.withValues(alpha: 0.2),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? colors.primary.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 8 : 4),
              spreadRadius: _isHovered ? 2 : 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: AppSizes.borderRadiusRegular,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.3)
                  : Colors.white.withValues(alpha: 0.7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project image
                  Container(
                    height: minHeight / 2.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.black.withValues(alpha: 0.2)
                          : Colors.white.withValues(alpha: 0.5),
                      border: Border(
                        bottom: BorderSide(
                          color: colors.outline.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                    padding: EdgeInsets.all(AppSizes.spacingMedium),
                    child: widget.project.imageUrl.isNotEmpty
                        ? Image.network(
                            widget.project.imageUrl,
                            fit: BoxFit.contain,
                            errorBuilder: (_, _, _) => Center(
                              child: Icon(
                                FontAwesomeIcons.image,
                                size: AppSizes.iconHuge,
                                color: colors.onSurface.withValues(alpha: 0.3),
                              ),
                            ),
                          )
                        : Center(
                            child: Icon(
                              FontAwesomeIcons.code,
                              size: AppSizes.iconHuge,
                              color: colors.onSurface.withValues(alpha: 0.3),
                            ),
                          ),
                  ),
                  Expanded(
                    child: Container(
                      padding: AppSizes.paddingLarge,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                child: FittedBox(
                                  child: SelectableText(
                                    widget.project.name,
                                    style: AppStyles.largeTextBold(),
                                  ),
                                ),
                              ),
                              if (widget.project.status != null &&
                                  widget.project.status!.isNotEmpty)
                                Container(
                                  padding: AppSizes.paddingXS,
                                  decoration: BoxDecoration(
                                    borderRadius: AppSizes.borderRadiusXS,
                                    color: _getStatusColor(widget.project.status)
                                        .withValues(alpha: 0.1),
                                    border: Border.all(
                                      width: 0.3,
                                      color:
                                          _getStatusColor(widget.project.status),
                                    ),
                                  ),
                                  child: SelectableText(
                                    widget.project.status!,
                                    style: AppStyles.extraSmallText(
                                      textColor:
                                          _getStatusColor(widget.project.status),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: AppSizes.spacingSmallRegular),
                          Expanded(
                            child: SelectableText(
                              widget.project.description,
                              style: AppStyles.regularText(
                                textColor:
                                    colors.onSurface.withValues(alpha: 0.7),
                              ),
                              maxLines: 4,
                            ),
                          ),
                          SizedBox(height: AppSizes.spacingSmallRegular),
                          SequentialAnimator(
                            delay: const Duration(milliseconds: 400),
                            itemDuration: const Duration(milliseconds: 200),
                            curve: Curves.bounceInOut,
                            animationBuilder: (child, animation) =>
                                ScaleTransition(
                              scale: Tween<double>(begin: 0, end: 1)
                                  .animate(animation),
                              child: child,
                            ),
                            builder: (children) {
                              final spacedChildren = <Widget>[];
                              for (int i = 0; i < children.length; i++) {
                                spacedChildren.add(children[i]);
                                if (i < children.length - 1) {
                                  spacedChildren.add(SizedBox(
                                    width: AppSizes.spacingSmall,
                                    height: AppSizes.spacingSmall,
                                  ));
                                }
                              }
                              return Wrap(
                                alignment: WrapAlignment.start,
                                runAlignment: WrapAlignment.start,
                                spacing: AppSizes.spacingSmall,
                                runSpacing: AppSizes.spacingSmall,
                                children: spacedChildren,
                              );
                            },
                            children: widget.project.techStack
                                .map((tech) => SkillChip(
                                      skillName: tech,
                                      compact: true,
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: AppSizes.spacingSmallRegular),
                          Divider(
                            color: colors.outline.withValues(alpha: 0.3),
                            height: 1,
                          ),
                          SizedBox(height: AppSizes.spacingSmallRegular),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.project.githubRepoLink != null)
                                _buildLink(context, FontAwesomeIcons.code,
                                    'Code', widget.project.githubRepoLink!),
                              if (widget.project.githubRepoLink != null &&
                                  widget.project.demoLink != null)
                                SizedBox(width: AppSizes.spacingLarge),
                              if (widget.project.demoLink != null)
                                _buildLink(
                                    context,
                                    FontAwesomeIcons.upRightFromSquare,
                                    'Demo',
                                    widget.project.demoLink!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLink(
      BuildContext context, IconData icon, String label, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: AppSizes.iconXS,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            SizedBox(width: AppSizes.spacingSmallRegular),
            Text(
              label,
              style: AppStyles.smallText(
                textColor:
                    Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedProjectItem extends StatelessWidget {
  const AnimatedProjectItem({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      builder: (_, value, child) => Transform.scale(
        scale: value,
        child: Opacity(
          opacity: value,
          child: child,
        ),
      ),
      child: ProjectItemNew(project: project),
    );
  }
}
