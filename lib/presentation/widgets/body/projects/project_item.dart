import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../data/models/project.dart';
import 'project_image.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key, required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dark header with image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Container(
              height: 180,
              width: double.infinity,
              color: const Color(0xFF1A1A1A),
              child: project.imageUrl.isNotEmpty
                  ? ProjectImage(imageUrl: project.imageUrl)
                  : Center(
                      child: Icon(
                        Icons.code,
                        size: 60,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
            ),
          ),
          // Content section
          Padding(
            padding: AppSizes.paddingMedium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with status badge
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SelectableText(
                        project.name,
                        style: AppStyles.regularTextBold(
                          textColor: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    if (project.status != null && project.status!.isNotEmpty) ...[
                      const SizedBox(width: AppSizes.spacingRegular),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spacingSmallRegular,
                          vertical: AppSizes.spacingXS,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(project.status!),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SelectableText(
                          project.status!,
                          style: AppStyles.smallText(
                            textColor: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: AppSizes.spacingRegular),
                // Description/Summary
                SelectableText(
                  project.description,
                  style: AppStyles.smallText(
                    textColor: Theme.of(context)
                        .colorScheme.onSurface
                        .withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: AppSizes.spacingLarge),
                // Tech stack tags
                if (project.techStack.isNotEmpty)
                  Wrap(
                    spacing: AppSizes.spacingSmall,
                    runSpacing: AppSizes.spacingSmall,
                    children: project.techStack.take(3).map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.spacingSmallRegular,
                          vertical: AppSizes.spacingXS,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme.primary
                              .withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme.primary
                                .withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _getTechIcon(tech),
                            const SizedBox(width: AppSizes.spacingXS),
                            SelectableText(
                              tech,
                              style: AppStyles.smallText(
                                textColor: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                const SizedBox(height: AppSizes.spacingLarge),
                // Code and Demo links
                Row(
                  children: [
                    if (project.githubRepoLink != null)
                      Expanded(
                        child: _buildLinkButton(
                          context,
                          icon: FontAwesomeIcons.code,
                          label: 'Code',
                          onTap: () async {
                            final uri = Uri.parse(project.githubRepoLink!);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri, mode: LaunchMode.externalApplication);
                            }
                          },
                        ),
                      ),
                    if (project.githubRepoLink != null && project.demoLink != null)
                      const SizedBox(width: AppSizes.spacingRegular),
                    if (project.demoLink != null)
                      Expanded(
                        child: _buildLinkButton(
                          context,
                          icon: FontAwesomeIcons.upRightFromSquare,
                          label: 'Demo',
                          onTap: () async {
                            final uri = Uri.parse(project.demoLink!);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri, mode: LaunchMode.externalApplication);
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.spacingRegular,
          vertical: AppSizes.spacingSmallRegular,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context)
                .colorScheme.onSurface
                .withValues(alpha: 0.2),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: AppSizes.iconSmall,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
            ),
            const SizedBox(width: AppSizes.spacingXS),
            Text(
              label,
              style: AppStyles.smallText(
                textColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    final lowerStatus = status.toLowerCase();
    if (lowerStatus.contains('progress')) {
      return const Color(0xFFFFF59D); // Light yellow
    } else if (lowerStatus.contains('completed') || lowerStatus.contains('done')) {
      return const Color(0xFFC8E6C9); // Light green
    } else if (lowerStatus.contains('hold') || lowerStatus.contains('paused')) {
      return const Color(0xFFFFCCBC); // Light orange
    }
    return const Color(0xFFE1BEE7); // Light purple (default)
  }

  Widget _getTechIcon(String tech) {
    final lowerTech = tech.toLowerCase();
    IconData icon;
    Color color;

    if (lowerTech.contains('flutter')) {
      icon = FontAwesomeIcons.mobileScreen;
      color = const Color(0xFF42A5F5);
    } else if (lowerTech.contains('tensorflow') || lowerTech.contains('tensor')) {
      icon = FontAwesomeIcons.brain;
      color = const Color(0xFFFF6F00);
    } else if (lowerTech.contains('opencv')) {
      icon = FontAwesomeIcons.eye;
      color = const Color(0xFF5C6BC0);
    } else if (lowerTech.contains('react')) {
      icon = FontAwesomeIcons.react;
      color = const Color(0xFF61DAFB);
    } else if (lowerTech.contains('node')) {
      icon = FontAwesomeIcons.node;
      color = const Color(0xFF339933);
    } else if (lowerTech.contains('python')) {
      icon = FontAwesomeIcons.python;
      color = const Color(0xFF3776AB);
    } else if (lowerTech.contains('dart')) {
      icon = FontAwesomeIcons.code;
      color = const Color(0xFF0175C2);
    } else {
      icon = FontAwesomeIcons.code;
      color = Colors.grey;
    }

    return Icon(icon, size: 12, color: color);
  }
}
