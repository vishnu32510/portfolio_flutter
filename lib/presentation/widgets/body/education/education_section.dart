import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/gradient_text.dart';
import '../../../../core/widgets/subtext.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';
import 'education_item.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final education = portfolioState.data?.education ?? [];
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
                      text: '*Academic* Journey',
                      textStyle: AppStyles.headlineTextBold(
                        textColor: colors.onSurface,
                        isMobile: context.isMobile,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacingMedium),
                  const Subtext(
                    'A timeline of my educational background, highlighting degrees, institutions, and key coursework that shaped my technical expertise.',
                  ),
                  SizedBox(height: AppSizes.spacingXXL),
                  SizedBox(
                    width: context.width * (context.isMobile ? 0.9 : 0.6),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: education.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (_, index) {
                        return EducationItem(
                          education: education[index],
                          isLast: index == education.length - 1,
                        );
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
