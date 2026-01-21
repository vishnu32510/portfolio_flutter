import 'package:flutter/material.dart';
import 'package:portfolio_flutter/core/utils/app_extensions.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_sizes.dart';
import 'contact_intro.dart';
import 'contact_form.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.06,
        horizontal: context.width < 800 ? AppSizes.spacingRegular : 0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width * 0.9),
          child: context.width > DeviceType.ipad.getMaxWidth()
              ? const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ContactIntro(),
                    ),
                    SizedBox(width: 32),
                    Expanded(child: ContactForm()),
                  ],
                )
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContactIntro(),
                    SizedBox(height: 32),
                    ContactForm(),
                  ],
                ),
        ),
      ),
    );
  }
}
