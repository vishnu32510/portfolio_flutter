part of 'navigation.dart';

Route<dynamic>? routeGenerator(RouteSettings settings) {
  final route = Routes.fromPath(settings.name ?? '/');

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

  // Calculate slide direction based on route order
  final targetIndex = route != null ? Routes.mainRoutes.indexOf(route) : -1;
  final currentRoute = AppNavigator.currentRoute;
  final currentIndex = currentRoute != null
      ? Routes.mainRoutes.indexOf(currentRoute)
      : -1;
  final slideFromRight = targetIndex > currentIndex;

  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(slideFromRight ? 1.0 : -1.0, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
          ),
        ),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
  );
}
