import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/services/services.dart';

class SocialMediaIcons extends StatelessWidget {
  final Map<String, String> socialLinks;
  
  const SocialMediaIcons({super.key, required this.socialLinks});

  IconData _getIconForLink(String link) {
    if (link.contains('dev.to')) return FontAwesomeIcons.dev;
    if (link.contains('github.com')) return FontAwesomeIcons.github;
    if (link.contains('devpost.com')) return FontAwesomeIcons.dev;
    if (link.contains('stackoverflow.com')) return FontAwesomeIcons.stackOverflow;
    if (link.contains('instagram.com')) return FontAwesomeIcons.instagram;
    if (link.contains('linkedin.com')) return FontAwesomeIcons.linkedinIn;
    if (link.contains('twitter.com')) return FontAwesomeIcons.twitter;
    if (link.contains('mailto:')) return FontAwesomeIcons.envelope;
    if (link.contains('floxi.co') || link.contains('portfolio')) return FontAwesomeIcons.globe;
    return FontAwesomeIcons.link;
  }

  @override
  Widget build(BuildContext context) {
    final links = socialLinks.entries.toList();
    
    return DelayedDisplay(
      slidingCurve: Curves.bounceIn,
      delay: const Duration(milliseconds: 350),
      child: Wrap(
        children: links.map((entry) => SocialMediaIconBtn(
          icon: _getIconForLink(entry.value),
          link: entry.value,
        )).toList(),
      ),
    );
  }
}

class SocialMediaIconBtn extends StatelessWidget {
  const SocialMediaIconBtn({super.key, required this.icon, required this.link});
  final IconData icon;
  final String link;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: IconButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: () {
        OpenLinkService().openUrl(link: link);
      },
      child: Icon(
        icon,
        size: 32,
      ),
    );
  }
}
