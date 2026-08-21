import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_flutter/navigation/routes.dart';

void main() {
  group('Route parsing with UTM query parameters', () {
    test('Root URL with UTM tags resolves to Routes.home', () {
      expect(
        Routes.fromPath('/?utm_source=linkedin&utm_medium=profile'),
        equals(Routes.home),
      );
      expect(Routes.fromPath('?utm_source=linkedin'), equals(Routes.home));
    });

    test('Section URLs with UTM tags resolve to correct routes', () {
      expect(
        Routes.fromPath('/projects?utm_source=github&utm_medium=readme'),
        equals(Routes.projects),
      );
      expect(
        Routes.fromPath('/experience?ref=linkedin'),
        equals(Routes.experience),
      );
      expect(Routes.fromPath('/skills?query=flutter'), equals(Routes.skills));
    });
  });
}
