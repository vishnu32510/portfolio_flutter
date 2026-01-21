part of 'navigation.dart';

// Track if splash has been shown in this session
bool _splashShown = false;

Route<dynamic>? routeGenerator(RouteSettings settings) {
  final routeName = settings.name ?? '/';
  
  // Handle splash screen ONLY for the very first initial route
  // Check if this is the initial route and splash hasn't been shown
  if (routeName == '/' && !_splashShown) {
    _splashShown = true;
    return PageRouteBuilder(
      settings: const RouteSettings(name: '/splash'),
      pageBuilder: (_, __, ___) => const SplashPage(),
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),  
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  // If '/' route is accessed again after splash was shown, go directly to home
  // This prevents double splash on browser refresh
  if (routeName == '/' && _splashShown) {
    return PageRouteBuilder(
      settings: RouteSettings(name: Routes.home.route),
      pageBuilder: (_, __, ___) => const HomePage(),
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  // Handle splash route - should only be reached from initial '/'
  if (routeName == '/splash') {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => const SplashPage(),
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  final route = Routes.fromPath(routeName);

  final Widget page;

  switch (route) {
    case Routes.home:
      page = const HomePage();
      break;
    case Routes.about:
      page = const AboutPage();
      break;
    case Routes.skills:
      page = const SkillsPage();
      break;
    case Routes.experience:
      page = const ExperiencePage();
      break;
    case Routes.projects:
      page = const ProjectsPage();
      break;
    case Routes.education:
      page = const EducationPage();
      break;
    case Routes.contact:
      page = const ContactPage();
      break;
    default:
      page = const NotFoundPage();
  }

  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation.drive(
        Tween<double>(begin: 0, end: 1).chain(
          CurveTween(
            curve: Curves.easeInOut,
          ),
        ),
      ),
      child: child,
    ),
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
  );
}
