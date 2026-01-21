import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/theme_enums.dart';
import '../../blocs/theme_bloc/theme_bloc.dart';

class ThemeHeader extends StatefulWidget {
  const ThemeHeader({super.key});

  @override
  State<ThemeHeader> createState() => _ThemeHeaderState();
}

class _ThemeHeaderState extends State<ThemeHeader> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Stack(
          children: [
            Visibility(
                visible: state.themeEventType == ThemeType.darkMode,
                replacement: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeEventChange(ThemeType.darkMode));
                    },
                    child: const CircleAvatar(
                      radius: 32, // Image radius
                      backgroundImage: AssetImage(
                        AppAssets.sunGif,
                      ),
                    )),
                child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeEventChange(ThemeType.lightMode));
                    },
                    child: const CircleAvatar(
                      radius: 32, // Image radius
                      backgroundImage: AssetImage(
                        AppAssets.moonGif,
                      ),
                    )))
          ],
        );
      },
    );
  }
}
