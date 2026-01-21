part of 'navigation.dart';

enum Routes {
  home(
    'Home',
    '/',
    icon: Icons.home,
  ),
  about(
    'About',
    '/about',
    icon: Icons.person,
  ),
  skills(
    'Skills',
    '/skills',
    icon: Icons.code,
  ),
  experience(
    'Experience',
    '/experience',
    icon: Icons.work,
  ),
  projects(
    'Projects',
    '/projects',
    icon: Icons.folder,
  ),
  education(
    'Education',
    '/education',
    icon: Icons.school,
  ),
  contact(
    'Contact',
    '/contact',
    icon: Icons.contact_mail,
  );

  final String name;
  final String route;
  final IconData icon;

  const Routes(this.name, this.route, {required this.icon});

  static Routes? fromPath(String path) {
    for (final route in Routes.values) {
      if (route.route == path) return route;
    }
    return null;
  }

  static Routes? fromName(String name) {
    for (final route in Routes.values) {
      if (route.name.toLowerCase() == name.toLowerCase()) return route;
    }
    return null;
  }

  static List<Routes> get mainRoutes => [
        Routes.home,
        Routes.about,
        Routes.skills,
        Routes.experience,
        Routes.projects,
        Routes.education,
        Routes.contact,
      ];
}
