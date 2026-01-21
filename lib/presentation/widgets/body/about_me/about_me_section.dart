import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';
import 'about_me_intro.dart';
import 'experience_info.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final colors = Theme.of(context).colorScheme;
        final data = portfolioState.data;
        final isMobileView = context.isMobile || context.width < context.height;

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.06,
            horizontal: context.width < 800 ? AppSizes.spacingRegular : 0,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.width * 0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Intro section
                  SizedBox(
                    width: context.width * 0.9,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: AppSizes.spacingXXL,
                      runSpacing: AppSizes.spacingXXL,
                      children: [
                        // Image placeholder - can be replaced with actual image
                        Container(
                          width: context.width * (context.isMobile ? 0.4 : 0.3),
                          height: context.width * (context.isMobile ? 0.4 : 0.3),
                          constraints: const BoxConstraints(
                            minWidth: 200,
                            minHeight: 200,
                            maxWidth: 350,
                            maxHeight: 350,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: AppSizes.borderRadiusRegular,
                            color: colors.surface,
                            border: Border.all(color: colors.outline),
                          ),
                          child: Icon(
                            Icons.person,
                            size: AppSizes.iconHuge * 2,
                            color: colors.primary.withValues(alpha: 0.3),
                          ),
                        ),
                        Container(
                          width: context.width * (context.isMobile ? 0.9 : 0.3),
                          constraints: const BoxConstraints(
                            minWidth: 500,
                          ),
                          child: Column(
                            crossAxisAlignment: isMobileView
                                ? CrossAxisAlignment.center
                                : CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (data != null) ...[
                                SelectableText(
                                  data.developerTitle,
                                  style: AppStyles.smallTextBold(
                                    textColor: colors.primary,
                                  ),
                                  textAlign: isMobileView ? TextAlign.center : TextAlign.start,
                                ),
                                SizedBox(height: AppSizes.spacingSmall),
                                GradientText(
                                  text: 'Building *Scalable* Solutions.',
                                  textStyle: AppStyles.headlineTextBold(
                                    textColor: colors.onSurface,
                                    isMobile: context.isMobile,
                                  ),
                                  textAlign: isMobileView ? TextAlign.center : TextAlign.start,
                                ),
                                SizedBox(height: AppSizes.spacingSmall),
                                SelectableText(
                                  data.introMessage,
                                  style: AppStyles.subText(
                                    textColor: colors.onSurface.withValues(alpha: 0.7),
                                    isMobile: context.isMobile,
                                  ),
                                  textAlign: isMobileView ? TextAlign.center : TextAlign.start,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.iconHuge),
                  // Experience Info
                  const ExperienceInfo(),
                  SizedBox(height: AppSizes.spacingXXL),
                  // Engineering Philosophy section
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: context.width * 0.9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: context.width * 0.9,
                          child: GradientText(
                            text: 'Engineering *Philosophy*',
                            textStyle: AppStyles.extraLargeTextBold(
                              textColor: colors.onSurface,
                            ),
                            textAlign: isMobileView ? TextAlign.center : TextAlign.start,
                          ),
                        ),
                        SizedBox(height: AppSizes.spacingXL),
                        SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            alignment: isMobileView
                                ? WrapAlignment.center
                                : WrapAlignment.spaceBetween,
                            runAlignment: WrapAlignment.start,
                            runSpacing: AppSizes.spacingLarge,
                            spacing: AppSizes.spacingLarge,
                            children: [
                              _buildPhilosophyCard(
                                context,
                                icon: Icons.code,
                                title: 'Clean Code',
                                description: 'Writing maintainable, scalable code following SOLID principles and best practices.',
                                color: Colors.blue,
                              ),
                              _buildPhilosophyCard(
                                context,
                                icon: Icons.architecture,
                                title: 'System Design',
                                description: 'Designing robust architectures that scale with business needs and handle complexity gracefully.',
                                color: Colors.purple,
                              ),
                              _buildPhilosophyCard(
                                context,
                                icon: Icons.people,
                                title: 'Collaboration',
                                description: 'Working closely with teams, mentoring developers, and contributing to open-source projects.',
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget _buildPhilosophyCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    final colors = Theme.of(context).colorScheme;
    final isMobile = context.isMobile;

    return ClipRRect(
      borderRadius: AppSizes.borderRadiusRegular,
      child: Container(
        height: context.height / 3.5,
        width: isMobile ? context.width : context.width / 5,
        constraints: const BoxConstraints(
          minWidth: 250,
          minHeight: 300,
        ),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: AppSizes.borderRadiusRegular,
          border: Border.all(color: colors.outline),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                icon,
                size: AppSizes.iconHuge * 1.5,
                color: colors.onSurface.withValues(alpha: 0.1),
              ),
            ),
            Padding(
              padding: AppSizes.paddingLarge,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color),
                      borderRadius: AppSizes.borderRadiusSmall,
                      color: color.withValues(alpha: 0.1),
                    ),
                    padding: AppSizes.paddingRegular,
                    child: Icon(
                      icon,
                      size: AppSizes.iconRegularMedium,
                      color: color,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacingLarge),
                  SelectableText(
                    title,
                    style: AppStyles.regularTextBold(),
                  ),
                  SizedBox(height: AppSizes.spacingRegular),
                  Expanded(
                    child: SelectableText(
                      description,
                      style: AppStyles.smallText(
                        textColor: colors.onSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
