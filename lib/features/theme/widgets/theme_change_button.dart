import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme_bloc/theme_bloc.dart';
import '../theme_enums.dart';

class ThemeChangeDropdownButton extends StatelessWidget {
  const ThemeChangeDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final colors = Theme.of(context).colorScheme;

        return DropdownButtonHideUnderline(
          child: DropdownButton<ThemeType>(
            elevation: 2,
            dropdownColor: colors.surface,
            focusColor: colors.surface,
            enableFeedback: false,
            value: state.themeEventType,
            icon: const SizedBox(),
            items: ThemeType.values.map((ThemeType item) {
              return DropdownMenuItem<ThemeType>(
                value: item,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (item.iconData is IconData &&
                        item.iconData != FontAwesomeIcons.spider)
                      Icon(
                        item.iconData as IconData,
                        size: 18,
                        color: colors.primary,
                      )
                    else
                      FaIcon(
                        FontAwesomeIcons.spider,
                        size: 18,
                        color: colors.primary,
                      ),
                    const SizedBox(width: 10),
                    Text(
                      item.themeName,
                      style: TextStyle(color: colors.onSurface, fontSize: 13),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (ThemeType? newValue) {
              if (newValue != null) {
                context.read<ThemeBloc>().add(ThemeEventChange(newValue));
              }
            },
          ),
        );
      },
    );
  }
}
