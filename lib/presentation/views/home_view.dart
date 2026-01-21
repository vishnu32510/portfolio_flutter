import 'package:flutter/material.dart';
import '../widgets/base_page/base_page.dart';
import '../widgets/body/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      content: HomeBody(),
    );
  }
}
