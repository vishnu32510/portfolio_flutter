import 'package:code_store_theme/code_store_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_flutter/core/theme/app_themes.dart';
import 'package:portfolio_flutter/core/utils/app_colors.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('code_store_theme Integration Tests', () {
    test('AppThemes.spiderMan has correct configuration', () {
      final spider = AppThemes.spiderMan;
      expect(spider.id, 'spider_man');
      expect(spider.name, 'Spider-Man: Brand New Day');
      expect(spider.icon, isNotNull);
      expect(spider.themeMode, ThemeMode.dark);
    });

    test('ThemeBloc switches dynamically to Spider-Man theme by ID', () async {
      final bloc = ThemeBloc(availableThemes: AppThemes.allThemes);
      expect(bloc.state.currentTheme.id, 'dark');

      bloc.add(const ThemeEventChangeById('spider_man'));
      await expectLater(
        bloc.stream,
        emits(
          isA<ThemeState>().having(
            (s) => s.currentTheme.id,
            'currentTheme.id',
            'spider_man',
          ),
        ),
      );

      expect(bloc.state.themeData.colorScheme.primary, AppThemes.spiderRed);
      expect(bloc.state.themeData.colorScheme.secondary, AppThemes.spiderBlue);
      expect(bloc.state.themeMode, ThemeMode.dark);

      // Verify AppCustomColors ThemeExtension
      final customColors = bloc.state.themeData.extension<AppCustomColors>();
      expect(customColors, isNotNull);
      expect(customColors!.laserRunner, const Color(0xFF38BDF8));
      expect(customColors.gridLine, const Color(0x30E62429));
      await bloc.close();
    });

    test('ThemeEventCycleNext cycles through all available themes', () async {
      final bloc = ThemeBloc(availableThemes: AppThemes.allThemes);
      expect(bloc.state.currentTheme.id, 'dark');

      // 1. Cycle to spider_man
      bloc.add(const ThemeEventCycleNext());
      await expectLater(
        bloc.stream,
        emits(
          isA<ThemeState>().having(
            (s) => s.currentTheme.id,
            'id',
            'spider_man',
          ),
        ),
      );

      // 2. Cycle to light
      bloc.add(const ThemeEventCycleNext());
      await expectLater(
        bloc.stream,
        emits(
          isA<ThemeState>().having((s) => s.currentTheme.id, 'id', 'light'),
        ),
      );

      // 3. Cycle back to dark
      bloc.add(const ThemeEventCycleNext());
      await expectLater(
        bloc.stream,
        emits(isA<ThemeState>().having((s) => s.currentTheme.id, 'id', 'dark')),
      );

      await bloc.close();
    });

    test('Edge Case: Fallback when unknown theme ID is requested', () async {
      final bloc = ThemeBloc(availableThemes: AppThemes.allThemes);
      expect(bloc.state.currentTheme.id, 'dark');

      // Request nonexistent theme -> should safely stay on current theme
      bloc.add(const ThemeEventChangeById('unknown_seasonal_theme'));
      await Future<void>.delayed(const Duration(milliseconds: 50));
      expect(bloc.state.currentTheme.id, 'dark');

      await bloc.close();
    });

    test('AppCustomColors presets and lerp works smoothly', () {
      final dark = AppCustomColors.dark;
      final spider = AppCustomColors.spiderMan;
      final lerped = dark.lerp(spider, 0.5);

      expect(lerped.laserRunner, isNotNull);
      expect(lerped.gridLine, isNotNull);
      expect(lerped.particleColor, isNotNull);
    });
  });
}
