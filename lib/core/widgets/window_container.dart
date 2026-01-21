import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/app_extensions.dart';
import '../utils/app_sizes.dart';
import '../utils/app_styles.dart';

class WindowContainer extends StatelessWidget {
  const WindowContainer({
    super.key,
    required this.content,
    required this.headline,
    required this.headlineIcon,
    required this.bottomText,
  });

  final Widget content;
  final String headline;
  final IconData headlineIcon;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: Container(
        constraints: BoxConstraints(maxWidth: context.width * 0.9),
        decoration: BoxDecoration(
          borderRadius: AppSizes.borderRadiusRegular,
          color: colors.surface.withValues(alpha: 0.5),
          border: Border.all(
            color: colors.outline,
          ),
        ),
        child: ClipRRect(
          borderRadius: AppSizes.borderRadiusRegular,
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colors.surface.withValues(alpha: 0.8),
                ),
                padding: AppSizes.paddingRegular,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: AppSizes.spacingRegular,
                      width: AppSizes.spacingRegular,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: AppSizes.spacingSmall),
                    Container(
                      height: AppSizes.spacingRegular,
                      width: AppSizes.spacingRegular,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(width: AppSizes.spacingSmall),
                    Container(
                      height: AppSizes.spacingRegular,
                      width: AppSizes.spacingRegular,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: colors.surface,
                            border: Border.all(color: colors.outline),
                            borderRadius: AppSizes.borderRadiusSmall,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                headlineIcon,
                                size: AppSizes.iconRegular,
                                color: colors.onSurface.withValues(alpha: 0.7),
                              ),
                              SizedBox(width: AppSizes.spacingRegular),
                              SelectableText(
                                headline,
                                style: AppStyles.regularText(
                                  textColor: colors.onSurface.withValues(alpha: 0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: content,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: colors.surface.withValues(alpha: 0.8),
                ),
                padding: AppSizes.paddingRegular,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.arrowRight,
                      color: Colors.green,
                      size: AppSizes.spacingRegular,
                    ),
                    SizedBox(width: AppSizes.spacingSmall),
                    SelectableText(
                      '~',
                      style: AppStyles.regularText(
                        textColor: colors.primary,
                      ),
                    ),
                    SizedBox(width: AppSizes.spacingSmall),
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SelectableText(
                          'echo "$bottomText"',
                          style: context.isMobile
                              ? AppStyles.smallText(
                                  textColor: colors.onSurface.withValues(alpha: 0.7),
                                )
                              : AppStyles.regularText(
                                  textColor: colors.onSurface.withValues(alpha: 0.7),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
