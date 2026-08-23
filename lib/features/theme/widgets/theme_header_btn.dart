import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/services/analytics_service.dart';
import '../../../core/utils/app_colors.dart';
import '../theme_bloc/theme_bloc.dart';
import '../theme_enums.dart';

class ThemeHeader extends StatefulWidget {
  const ThemeHeader({super.key});

  @override
  State<ThemeHeader> createState() => _ThemeHeaderState();
}

class _ThemeHeaderState extends State<ThemeHeader> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final currentType = state.themeEventType;
        final theme = Theme.of(context);
        final primaryColor = theme.colorScheme.primary;
        final customColors = context.customColors;

        final dynamic currentIcon;
        final Color iconColor;
        final String tooltip;
        final ThemeType nextTheme;

        switch (currentType) {
          case ThemeType.darkMode:
            currentIcon = Icons.nightlight_round;
            iconColor = const Color(0xFFF1C40F);
            tooltip = 'Switch to Spider-Man: Brand New Day';
            nextTheme = ThemeType.spiderMan;
            break;
          case ThemeType.spiderMan:
            currentIcon = FontAwesomeIcons.spider;
            iconColor = const Color(0xFFFF334B);
            tooltip = 'Switch to Light Theme';
            nextTheme = ThemeType.lightMode;
            break;
          case ThemeType.lightMode:
          case ThemeType.system:
            currentIcon = Icons.wb_sunny_rounded;
            iconColor = const Color(0xFFE67E22);
            tooltip = 'Switch to Dark Theme';
            nextTheme = ThemeType.darkMode;
            break;
        }

        final isDarkOrSpider =
            currentType == ThemeType.darkMode ||
            currentType == ThemeType.spiderMan;

        return Tooltip(
          message: tooltip,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: GestureDetector(
              onTap: () {
                AnalyticsService.logThemeToggle(
                  nextTheme != ThemeType.lightMode,
                );
                context.read<ThemeBloc>().add(ThemeEventChange(nextTheme));
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDarkOrSpider
                      ? (_isHovered
                            ? customColors.glowColor
                            : Colors.white.withValues(alpha: 0.06))
                      : (_isHovered
                            ? Colors.black.withValues(alpha: 0.08)
                            : Colors.black.withValues(alpha: 0.04)),
                  border: Border.all(
                    color: _isHovered
                        ? primaryColor.withValues(alpha: 0.8)
                        : (isDarkOrSpider
                              ? customColors.accentGlow
                              : Colors.black.withValues(alpha: 0.1)),
                    width: 1.2,
                  ),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: customColors.glowColor,
                            blurRadius: 14,
                            spreadRadius: 1.5,
                          ),
                        ]
                      : (currentType == ThemeType.spiderMan
                            ? [
                                BoxShadow(
                                  color: customColors.accentGlow,
                                  blurRadius: 8,
                                  spreadRadius: 0.5,
                                ),
                              ]
                            : []),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    transitionBuilder: (child, animation) {
                      return RotationTransition(
                        turns: Tween<double>(
                          begin: 0.75,
                          end: 1.0,
                        ).animate(animation),
                        child: ScaleTransition(scale: animation, child: child),
                      );
                    },
                    child: currentType == ThemeType.spiderMan
                        ? FaIcon(
                            FontAwesomeIcons.spider,
                            key: ValueKey<ThemeType>(currentType),
                            size: 18,
                            color: iconColor,
                          )
                        : Icon(
                            currentIcon as IconData,
                            key: ValueKey<ThemeType>(currentType),
                            size: 22,
                            color: iconColor,
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
