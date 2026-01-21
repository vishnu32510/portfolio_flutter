import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/hover_glow_text.dart';
import '../../../navigation/navigation.dart';
import '../../blocs/portfolio_bloc/portfolio_bloc.dart';
import '../../blocs/theme_bloc/theme_bloc.dart';
import '../../../core/utils/theme_enums.dart';
import 'theme_header_btn.dart';

class WebOptions extends StatefulWidget {
  const WebOptions({super.key});

  @override
  State<WebOptions> createState() => _WebOptionsState();
}

class _WebOptionsState extends State<WebOptions> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isCompactWidth = context.width < 800;

    if (context.isMobile || isCompactWidth) {
      return const SizedBox.shrink();
    }

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
