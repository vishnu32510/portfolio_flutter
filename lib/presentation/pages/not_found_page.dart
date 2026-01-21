import 'package:flutter/material.dart';
import '../../core/utils/app_styles.dart';
import '../../navigation/navigation.dart';
import '../widgets/base_page/base_page.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              '404',
              style: AppStyles.s52.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SelectableText(
              'Page Not Found',
              style: AppStyles.s24,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => AppNavigator.goHome(),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
