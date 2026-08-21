import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/analytics_service.dart';
import '../../../core/utils/theme_enums.dart';
import '../../blocs/theme_bloc/theme_bloc.dart';

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
        final isDark = state.themeEventType == ThemeType.darkMode;
        final theme = Theme.of(context);
        final primaryColor = theme.colorScheme.primary;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () {
              final newTheme = isDark
                  ? ThemeType.lightMode
                  : ThemeType.darkMode;
              AnalyticsService.logThemeToggle(!isDark);
              context.read<ThemeBloc>().add(ThemeEventChange(newTheme));
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? (_isHovered
                          ? Colors.white.withValues(alpha: 0.12)
                          : Colors.white.withValues(alpha: 0.06))
                    : (_isHovered
                          ? Colors.black.withValues(alpha: 0.08)
                          : Colors.black.withValues(alpha: 0.04)),
                border: Border.all(
                  color: _isHovered
                      ? primaryColor.withValues(alpha: 0.6)
                      : (isDark
                            ? Colors.white.withValues(alpha: 0.15)
                            : Colors.black.withValues(alpha: 0.1)),
                  width: 1.2,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: primaryColor.withValues(alpha: 0.2),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ]
                    : [],
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
                  child: Icon(
                    isDark ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                    key: ValueKey<bool>(isDark),
                    size: 22,
                    color: isDark
                        ? const Color(0xFFF1C40F)
                        : const Color(0xFFE67E22),
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
