import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_flutter/core/utils/theme_enums.dart';
import 'package:portfolio_flutter/presentation/blocs/theme_bloc/theme_bloc.dart';

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
      await bloc.close();
    });
  });
}
