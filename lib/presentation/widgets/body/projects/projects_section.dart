import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/subtext.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';
import 'project_item_new.dart';
import 'project_tag_selector.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  ProjectTag _selectedTag = ProjectTag.all;

  @override
  void initState() {
    super.initState();
    // Trigger lazy loading when section is first rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<PortfolioBloc>().add(const LoadProjects());
      }
    });
  }

  List<dynamic> _filterProjects(List<dynamic> projects) {
    if (_selectedTag == ProjectTag.all) return projects;
    
    return projects.where((project) {
      final techStack = project.techStack as List<String>;
      final tagLower = _selectedTag.value.toLowerCase();
      
      if (tagLower == 'mobile') {
        return techStack.any((tech) => 
          tech.toLowerCase().contains('flutter') ||
          tech.toLowerCase().contains('android') ||
          tech.toLowerCase().contains('ios') ||
          tech.toLowerCase().contains('mobile')
        );
      } else if (tagLower == 'web') {
        return techStack.any((tech) => 
          tech.toLowerCase().contains('web') ||
          tech.toLowerCase().contains('react') ||
          tech.toLowerCase().contains('html') ||
          tech.toLowerCase().contains('css')
        );
      } else if (tagLower == 'ai') {
        return techStack.any((tech) => 
          tech.toLowerCase().contains('ai') ||
          tech.toLowerCase().contains('ml') ||
          tech.toLowerCase().contains('tensorflow') ||
          tech.toLowerCase().contains('opencv')
        );
      } else if (tagLower == 'backend') {
        return techStack.any((tech) => 
          tech.toLowerCase().contains('backend') ||
          tech.toLowerCase().contains('node') ||
          tech.toLowerCase().contains('api') ||
          tech.toLowerCase().contains('server')
        );
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final allProjects = portfolioState.data?.projects ?? [];
        final colors = Theme.of(context).colorScheme;
        final projects = _filterProjects(allProjects);

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.06,
            horizontal: context.width < 800 ? AppSizes.spacingRegular : 0,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.width * 0.9),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.width * 0.9,
                    child: GradientText(
                      text: 'Selected *Works*',
                      textStyle: AppStyles.headlineTextBold(
                        textColor: colors.onSurface,
                        isMobile: context.isMobile,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacingMedium),
                  const Subtext(
                    'A multidisciplinary portfolio spanning mobile applications, web development, AI systems, and full-stack production systems.',
                  ),
                  SizedBox(height: AppSizes.spacingXL),
                  ProjectTagSelector(
                    selectedTag: _selectedTag,
                    onChanged: (tag) => setState(() => _selectedTag = tag),
                  ),
                  SizedBox(height: AppSizes.spacingXXL),
                  Container(
                    alignment: Alignment.center,
                    width: context.width * 0.9,
                    child: AnimationLimiter(
                      child: Wrap(
                        key: ValueKey(_selectedTag),
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.start,
                        spacing: AppSizes.spacingLarge,
                        runSpacing: AppSizes.spacingLarge,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 600),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                          children: projects
                              .map((project) => ProjectItemNew(project: project))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
