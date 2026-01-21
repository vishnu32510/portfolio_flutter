import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/app_sizes.dart';
import '../../blocs/portfolio_bloc/portfolio_bloc.dart';

class GlobalFooter extends StatelessWidget {
  const GlobalFooter({super.key});

  IconData _getIconForLink(String link) {
    if (link.contains('dev.to')) return FontAwesomeIcons.dev;
    if (link.contains('github.com')) return FontAwesomeIcons.github;
    if (link.contains('devpost.com')) return FontAwesomeIcons.dev;
    if (link.contains('stackoverflow.com')) return FontAwesomeIcons.stackOverflow;
    if (link.contains('instagram.com')) return FontAwesomeIcons.instagram;
    if (link.contains('linkedin.com')) return FontAwesomeIcons.linkedin;
    if (link.contains('twitter.com')) return FontAwesomeIcons.twitter;
    if (link.contains('mailto:')) return FontAwesomeIcons.envelope;
    if (link.contains('floxi.co') || link.contains('portfolio')) return FontAwesomeIcons.globe;
    return FontAwesomeIcons.link;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.width < 600;
    
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final socialLinks = portfolioState.data?.socialLinks ?? {};
        final links = socialLinks.entries.toList();
        
        return Container(
          width: context.width,
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: AppSizes.paddingLarge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SelectableText(
                '// Connect',
                style: AppStyles.regularTextBold(
                  textColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(height: AppSizes.spacingRegular),
              Wrap(
                spacing: AppSizes.spacingLarge,
                runSpacing: AppSizes.spacingRegular,
                alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                children: links.map((entry) => _buildSocialIcon(
                  context,
                  _getIconForLink(entry.value),
                  entry.value,
                )).toList(),
              ),
              SizedBox(height: AppSizes.spacingLarge),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: isMobile ? WrapAlignment.center : WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/logo/flutter.svg',
                            height: AppSizes.iconSmall,
                            width: AppSizes.iconSmall,
                          ),
                          SizedBox(width: AppSizes.spacingSmall),
                          SelectableText(
                            'Built with Flutter',
                            style: AppStyles.smallText(
                              textColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                            ),
                          ),
                          SizedBox(width: AppSizes.spacingLarge),
                          SvgPicture.asset(
                            'assets/logo/firebase.svg',
                            height: AppSizes.iconSmall,
                            width: AppSizes.iconSmall,
                          ),
                          SizedBox(width: AppSizes.spacingSmall),
                          SelectableText(
                            'Deployed to Firebase',
                            style: AppStyles.smallText(
                              textColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FontAwesomeIcons.copyright,
                            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                            size: AppSizes.iconXS,
                          ),
                          SizedBox(width: AppSizes.spacingSmall),
                          SelectableText(
                            'Designed & Built by ${portfolioState.data?.developerName ?? "Vishnu Priyan"} · ${DateTime.now().year}',
                            style: AppStyles.smallText(
                              textColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSocialIcon(BuildContext context, IconData icon, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: Icon(
          icon,
          size: AppSizes.iconLarge,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}

