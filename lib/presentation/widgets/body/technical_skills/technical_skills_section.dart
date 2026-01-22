import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/subtext.dart';
import '../../../../core/widgets/window_container.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';
import 'skill_item.dart';

class TechnicalSkillsSection extends StatefulWidget {
  const TechnicalSkillsSection({super.key});

  @override
  State<TechnicalSkillsSection> createState() => _TechnicalSkillsSectionState();
}

class _TechnicalSkillsSectionState extends State<TechnicalSkillsSection> {
  @override
  void initState() {
    super.initState();
    // Trigger lazy loading when section is first rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<PortfolioBloc>().add(const LoadTechnicalSkills());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final skills = portfolioState.data?.technicalSkills ?? [];
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
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: context.width * 0.9,
                    child: GradientText(
                      text: 'The *Tech* *Stack* Terminal',
                      textStyle: AppStyles.headlineTextBold(
                        textColor: colors.onSurface,
                        isMobile: context.isMobile,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacingMedium),
                  const Subtext(
                    'The complete toolset deployed to build low-latency systems and production-grade mobile and web applications.',
                  ),
                  SizedBox(height: AppSizes.spacingXXL),
                  WindowContainer(
                    headlineIcon: FontAwesomeIcons.solidFolder,
                    headline: '~/portfolio/skills',
                    bottomText: 'Stack Initialized Successfully.',
                    content: Padding(
                      padding: AppSizes.paddingLarge,
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        runAlignment: WrapAlignment.spaceEvenly,
                        runSpacing: AppSizes.spacingLarge,
                        spacing: AppSizes.spacingLarge,
                        children: skills
                            .map((skillGroup) => SkillItem(
                                  skillGroup: skillGroup,
                                ))
                            .toList(),
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
