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
    transitionDuration: 600.milliseconds,
    reverseTransitionDuration: 600.milliseconds,
  );
}
