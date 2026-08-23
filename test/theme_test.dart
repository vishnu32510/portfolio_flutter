import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_flutter/core/utils/app_colors.dart';
import 'package:portfolio_flutter/features/theme/theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ThemeBloc and ThemeType Tests', () {
    test('ThemeType.spiderMan has correct name and icon', () {
      expect(ThemeType.spiderMan.themeName, 'Spider-Man: Brand New Day');
      expect(ThemeType.spiderMan.iconData, isNotNull);
    });

    test('ThemeBloc emits SpiderManThemeState on ThemeEventChange(ThemeType.spiderMan)', () async {
      final bloc = ThemeBloc();
      expect(bloc.state.themeEventType, ThemeType.darkMode);

      bloc.add(const ThemeEventChange(ThemeType.spiderMan));
      await expectLater(
        bloc.stream,
        emits(isA<ThemeState>().having(
          (s) => s.themeEventType,
          'themeEventType',
          ThemeType.spiderMan,
        )),
      );

      expect(bloc.state.themeData.colorScheme.primary, ThemeState.spiderRed);
      expect(bloc.state.themeData.colorScheme.secondary, ThemeState.spiderBlue);
      expect(bloc.state.themeMode, ThemeMode.dark);

      // Verify AppCustomColors ThemeExtension
      final customColors = bloc.state.themeData.extension<AppCustomColors>();
      expect(customColors, isNotNull);
      expect(customColors!.laserRunner, const Color(0xFF38BDF8));
      expect(customColors.gridLine, const Color(0x30E62429));
      await bloc.close();
    });

    test('AppCustomColors presets and lerp works smoothly', () {
      final dark = AppCustomColors.dark;
      final spider = AppCustomColors.spiderMan;
      final lerped = dark.lerp(spider, 0.5);

      expect(lerped.laserRunner, isNotNull);
      expect(lerped.gridLine, isNotNull);
    });
  });
}
