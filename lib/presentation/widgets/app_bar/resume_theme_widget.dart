import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_styles.dart';
import '../../blocs/portfolio_bloc/portfolio_bloc.dart';
import 'theme_header_btn.dart';

class ResumeThemeWidget extends StatelessWidget {
  const ResumeThemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Resume Button
        BlocBuilder<PortfolioBloc, PortfolioState>(
          builder: (context, portfolioState) {
            final resumeLink = portfolioState.data?.resumeLink ??
                'https://drive.google.com/file/d/1WDLPye0JSXinnxGaFskq1mqi42cVCjKy/view?usp=sharing';
            
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  final uri = Uri.parse(resumeLink);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                child: Container(
                  height: AppSizes.spacingXL,
                  decoration: BoxDecoration(
                    borderRadius: AppSizes.borderRadiusXS,
                    border: Border.all(color: colors.outline),
                    color: colors.primary,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.spacingSmallRegular,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Resume',
                        style: AppStyles.regularText(
                          textColor: colors.onPrimary,
                        ),
                      ),
                      const SizedBox(width: AppSizes.spacingSmall),
                      Icon(
                        FontAwesomeIcons.arrowUpRightFromSquare,
                        size: AppSizes.iconSmall,
                        color: colors.onPrimary,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(width: AppSizes.spacingLarge),
        // Theme Button (always visible)
        const ThemeHeader(),
      ],
    );
  }
}
