import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/subtext.dart';
import '../../../../core/widgets/timeline_container.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';
import 'experience_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const int topK = 3;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final experiences = portfolioState.data?.experiences ?? [];
        final colors = Theme.of(context).colorScheme;

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height * 0.06,
            horizontal: context.width < 800 ? AppSizes.spacingRegular : 0,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.width * 0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: context.width * 0.9,
                    child: GradientText(
                      text: '*Career* Path',
                      textStyle: AppStyles.headlineTextBold(
                        textColor: colors.onSurface,
                        isMobile: context.isMobile,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacingMedium),
                  const Subtext(
                    'A timeline of my professional journey in software engineering, focusing on scalable architecture, mobile development, and full-stack solutions.',
                  ),
                  SizedBox(height: AppSizes.spacingXXL),
                  SizedBox(
                    width: context.width * (context.isMobile ? 0.9 : 0.6),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: experiences.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (_, index) {
                        final experience = ExperienceItem(
                          experience: experiences[index],
                          collapsed: index >= topK,
                        );
                        if (index == topK) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TimelineContainer(
                                showContainer: false,
                                child: SelectableText(
                                  'Previous Work',
                                  style: AppStyles.largeTextBold(
                                    textColor: colors.onSurface.withValues(alpha: 0.5),
                                  ),
                                ),
                              ),
                              experience,
                            ],
                          );
                        } else {
                          return experience;
                        }
                      },
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
