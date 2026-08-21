import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_sizes.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import '../app_bar/theme_header_btn.dart';
import '../app_bar/vertical_headers_builder.dart';
import 'intro/intro_section.dart';
import 'projects/projects_section.dart';
import 'technical_skills/technical_skills_section.dart';
import 'experience/experience_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final introKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AppBarHeadersIndexChanged) {
          Navigator.of(context).maybePop();
          const duration = Duration(milliseconds: 300);
          // Order matches AppBarHeaders: Home (0), Projects (1), Experience (2), Skills (3), About (4)
          if (state.index == 0) {
            Scrollable.ensureVisible(
              introKey.currentContext!,
              duration: duration,
            );
          }
          if (state.index == 1) {
            Scrollable.ensureVisible(
              projectKey.currentContext!,
              duration: duration,
            );
          }
          if (state.index == 2) {
            Scrollable.ensureVisible(
              experienceKey.currentContext!,
              duration: duration,
            );
          }
          if (state.index == 3) {
            Scrollable.ensureVisible(
              skillsKey.currentContext!,
              duration: duration,
            );
          }
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.width < DeviceType.ipad.getMaxWidth()
                  ? AppSizes.spacingRegular
                  : AppSizes.spacingXXL,
            ),
            child: Column(
              children: [
                IntroSection(key: introKey),
                TechnicalSkillsSection(key: skillsKey),
                ExperienceSection(key: experienceKey),
                ProjectsSection(key: projectKey),
              ],
            ),
          ),
          const VerticalHeadersBuilder(),
          Padding(
            padding: const EdgeInsets.all(AppSizes.spacingLarge),
            child: const Align(
              alignment: Alignment.bottomRight,
              child: ThemeHeader(),
            ),
          ),
        ],
      ),
    );
  }
}
