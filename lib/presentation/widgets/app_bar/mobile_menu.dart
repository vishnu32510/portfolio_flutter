import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/hover_glow_text.dart';
import '../../../navigation/navigation.dart';
import '../../blocs/portfolio_bloc/portfolio_bloc.dart';
import 'theme_header_btn.dart';

class MobileMenu extends StatefulWidget {
  const MobileMenu({super.key});

  @override
  State<MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<MobileMenu> {
  bool _menuOpen = false;

  Widget _createMenu() {
    final colors = Theme.of(context).colorScheme;

    return PopupMenuButton<dynamic>(
      tooltip: 'More',
      offset: Offset(0, AppSizes.spacingXL + AppSizes.spacingSmall),
      shape: RoundedRectangleBorder(
        borderRadius: AppSizes.borderRadiusSmall,
        side: BorderSide(color: colors.outline),
      ),
      color: colors.surface,
      onOpened: () => setState(() => _menuOpen = true),
      onCanceled: () => setState(() => _menuOpen = false),
      onSelected: (value) {
        setState(() => _menuOpen = false);
        if (value is Routes) {
          AppNavigator.pushReplacement(value);
        }
      },
      itemBuilder: (popupContext) {
        final popupColors = Theme.of(popupContext).colorScheme;
        return [
          ...Routes.mainRoutes.map(
            (route) => PopupMenuItem<Routes>(
              value: route,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    route.icon,
                    size: AppSizes.iconSmall,
                    color: popupColors.primary,
                  ),
                  SizedBox(width: AppSizes.spacingRegular),
                  HoverGlowText(
                    text: Text(
                      route.name,
                      style: AppStyles.smallText(
                        textColor: popupColors.onSurface,
                      ),
                    ),
                    glowColor: popupColors.primary,
                    alwaysHighlight: _isCurrentRoute(route),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuDivider(
            height: AppSizes.spacingMedium,
          ),
          // Resume option
          PopupMenuItem<void>(
            onTap: () async {
              final portfolioState = context.read<PortfolioBloc>().state;
              final resumeLink = portfolioState.data?.resumeLink ??
                  'https://drive.google.com/file/d/1WDLPye0JSXinnxGaFskq1mqi42cVCjKy/view?usp=sharing';
              final uri = Uri.parse(resumeLink);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.arrowUpRightFromSquare,
                  size: AppSizes.iconSmall,
                  color: popupColors.primary,
                ),
                SizedBox(width: AppSizes.spacingRegular),
                Text(
                  'Resume',
                  style: AppStyles.smallText(
                    textColor: popupColors.onSurface,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuDivider(
            height: AppSizes.spacingMedium,
          ),
          // Theme switcher
          PopupMenuItem<void>(
            enabled: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Toggle Theme',
                  style: AppStyles.smallText(textColor: popupColors.onSurface),
                ),
                ThemeHeader(),
              ],
            ),
          ),
        ];
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: Icon(
          _menuOpen ? FontAwesomeIcons.xmark : FontAwesomeIcons.bars,
          key: ValueKey(_menuOpen),
          size: AppSizes.iconMedium,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }

  bool _isCurrentRoute(Routes route) {
    final currentRouteName = ModalRoute.of(context)?.settings.name;
    return currentRouteName == route.route;
  }

  @override
  Widget build(BuildContext context) {
    return _createMenu();
  }
}

