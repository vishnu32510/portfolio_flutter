import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import '../../../../core/services/services.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../data/models/project.dart';

class ProjectActions extends StatelessWidget {
  const ProjectActions({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (project.demoLink != null)
            Expanded(
              child: CustomButton(
                label: 'Preview',
                backgroundColor: AppColors.primaryColor.withOpacity(0.5),
                onPressed: () {
                  html.window.open(project.demoLink!, '_blank');
                },
              ),
            ),
          if (project.githubRepoLink != null) ...[
            if (project.demoLink != null) const SizedBox(width: 18),
            Expanded(
              child: CustomButton(
                label: 'Github',
                borderColor: AppColors.primaryColor,
                onPressed: () {
                  OpenLinkService().openUrl(link: project.githubRepoLink ?? "");
                },
              ),
            ),
          ],
          if (project.googlePlay != null) ...[
            if (project.demoLink != null || project.githubRepoLink != null)
              const SizedBox(width: 18),
            Expanded(
              child: CustomButton(
                label: 'Play Store',
                textColor: AppColors.white,
                backgroundColor: AppColors.blueColor,
                borderColor: AppColors.primaryColor,
                onPressed: () {
                  html.window.open(project.googlePlay!, '_blank');
                },
              ),
            ),
          ],
          if (project.demoLink == null &&
              project.githubRepoLink == null &&
              project.googlePlay == null)
            Expanded(
              child: CustomButton(
                label: 'No actions available',
                borderColor: AppColors.primaryColor,
                onPressed: () {},
              ),
            )
        ],
      ),
    );
  }
}
