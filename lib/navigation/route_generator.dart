part of 'navigation.dart';

Route<dynamic>? routeGenerator(RouteSettings settings) {
  var path = settings.name ?? '/';
  if (path == '/contact') path = '/about';
  final route = Routes.fromPath(path);

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
    default:
      page = const NotFoundPage();
  }

  // Calculate slide direction based on route order
  final targetIndex = route != null ? Routes.mainRoutes.indexOf(route) : -1;
  final currentRoute = AppNavigator.currentRoute;
  final currentIndex = currentRoute != null
      ? Routes.mainRoutes.indexOf(currentRoute)
      : -1;

  // Update direction in AppNavigator for consistent Primary/Secondary animations
  if (currentIndex != -1 && targetIndex != -1) {
    AppNavigator.isSlideFromRight = targetIndex > currentIndex;
  }

  return PageRouteBuilder(
    settings: RouteSettings(name: path, arguments: settings.arguments),
    pageBuilder: (_, _, _) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slideFromRight = AppNavigator.isSlideFromRight;

      // Primary Animation (Incoming Page)
      final primaryOffset =
          Tween<Offset>(
            begin: Offset(slideFromRight ? 1.0 : -1.0, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
          );

      // Secondary Animation (Outgoing Page) - This mimics the "Slide Left" behavior
      // when a new page covers it (Forward) or "Slide Right" (Backward)
      final secondaryOffset =
          Tween<Offset>(
            begin: Offset.zero,
            end: Offset(slideFromRight ? -1.0 : 1.0, 0),
          ).animate(
            CurvedAnimation(
              parent: secondaryAnimation,
              curve: Curves.easeInOutCubic,
            ),
          );

      return SlideTransition(
        position: primaryOffset,
        child: SlideTransition(position: secondaryOffset, child: child),
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
  );
}
