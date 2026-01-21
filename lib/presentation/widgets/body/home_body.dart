import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_sizes.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import '../app_bar/theme_header_btn.dart';
import '../app_bar/vertical_headers_builder.dart';
// import 'Toasts/toasts.dart';
import 'contact/contact_section.dart';
import 'intro/intro_section.dart';
import 'projects/projects_section.dart';
import 'technical_skills/technical_skills_section.dart';
import 'experience/experience_section.dart';
import 'education/education_section.dart';

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
  final educationKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // WelcomeToasts(context);
    return DelayedDisplay(
      slidingCurve: Curves.fastEaseInToSlowEaseOut,
      delay: const Duration(milliseconds: 350),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is AppBarHeadersIndexChanged) {
            Navigator.of(context).maybePop();
            const duration = Duration(milliseconds: 300);
            if (state.index == 0) {
              Scrollable.ensureVisible(
                introKey.currentContext!,
                duration: duration,
              );
            }
            if (state.index == 1) {
              Scrollable.ensureVisible(
                skillsKey.currentContext!,
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
                projectKey.currentContext!,
                duration: duration,
              );
            }
            if (state.index == 4) {
              Scrollable.ensureVisible(
                educationKey.currentContext!,
                duration: duration,
              );
            }
            if (state.index == 5) {
              Scrollable.ensureVisible(
                contactKey.currentContext!,
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
                  DelayedDisplay(
                      slidingCurve: Curves.ease,
                      delay: const Duration(milliseconds: 1200),
                      child: IntroSection(key: introKey)),
                  TechnicalSkillsSection(key: skillsKey),
                  ExperienceSection(key: experienceKey),
                  ProjectsSection(key: projectKey),
                  EducationSection(key: educationKey),
                  ContactSection(key: contactKey),
                ],
              ),
            ),
            const DelayedDisplay(
                slidingCurve: Curves.ease,
                delay: Duration(milliseconds: 1000),
                child: VerticalHeadersBuilder()),
            Padding(
              padding: const EdgeInsets.all(AppSizes.spacingLarge),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: ThemeHeader(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
