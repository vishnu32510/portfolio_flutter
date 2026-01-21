import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter/core/utils/app_constants.dart';
import 'package:portfolio_flutter/navigation/navigation.dart';
import 'package:portfolio_flutter/presentation/blocs/portfolio_bloc/portfolio_bloc.dart';
import 'package:portfolio_flutter/presentation/blocs/theme_bloc/theme_bloc.dart';

import 'presentation/blocs/home_bloc/home_bloc.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => PortfolioBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(
            portfolioBloc: context.read<PortfolioBloc>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: AppNavigator.navigatorKey,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown,
              },
            ),
            themeAnimationCurve: Curves.fastOutSlowIn,
            themeAnimationDuration: const Duration(milliseconds: 200),
            debugShowCheckedModeBanner: false,
            title: AppConstants.appTitle,
            theme: LightThemeState.lightTheme.themeData,
            darkTheme: DarkThemeState.darkTheme.themeData,
            themeMode: state.themeMode,
            onGenerateRoute: routeGenerator,
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
