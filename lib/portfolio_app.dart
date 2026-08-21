import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter/core/utils/app_constants.dart';
import 'package:portfolio_flutter/navigation/navigation.dart';
import 'package:portfolio_flutter/presentation/blocs/portfolio_bloc/portfolio_bloc.dart';
import 'package:portfolio_flutter/presentation/blocs/theme_bloc/theme_bloc.dart';

import 'presentation/blocs/home_bloc/home_bloc.dart';
import 'core/services/analytics_service.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => PortfolioBloc()),
        BlocProvider(
          create: (context) =>
              HomeBloc(portfolioBloc: context.read<PortfolioBloc>()),
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
            navigatorObservers: [_AnalyticsRouteObserver()],
            onGenerateRoute: routeGenerator,
            initialRoute: '/',
          );
        },
      ),
    );
  }
}

class _AnalyticsRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final name = route.settings.name;
    if (name != null) {
      AnalyticsService.logScreenView(name);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    final name = newRoute?.settings.name;
    if (name != null) {
      AnalyticsService.logScreenView(name);
    }
  }
}
