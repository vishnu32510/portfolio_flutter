import 'package:flutter/material.dart';
import '../widgets/base_page/base_page.dart';
import '../widgets/body/contact/contact_section.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      content: ContactSection(),
    );
  }
}
