import 'package:flutter/material.dart';

import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/hover_glow_text.dart';
import '../../../navigation/navigation.dart';

class CustomHeaderBtn extends StatelessWidget {
  const CustomHeaderBtn({super.key, required this.headerIndex});

  final int headerIndex;

  Routes get _route {
    switch (headerIndex) {
      case 0:
        return Routes.home;
      case 1:
        return Routes.about;
      case 2:
        return Routes.skills;
      case 3:
        return Routes.experience;
      case 4:
        return Routes.projects;
      case 5:
        return Routes.education;
      case 6:
        return Routes.contact;
      default:
        return Routes.home;
    }
  }

  bool _isCurrentRoute(BuildContext context) {
    final currentRouteName = ModalRoute.of(context)?.settings.name;
    return currentRouteName == _route.route;
  }

  @override
  Widget build(BuildContext context) {
    final isActive = _isCurrentRoute(context);

    return HoverGlowText(
      text: Text(
        AppBarHeaders.values[headerIndex].getString(),
        style: AppStyles.regularText(),
      ),
      alwaysHighlight: isActive,
      onTap: isActive ? null : () => AppNavigator.pushReplacement(_route),
      glowColor: Theme.of(context).colorScheme.primary,
    );
  }
}
