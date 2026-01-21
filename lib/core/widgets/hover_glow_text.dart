import 'package:flutter/material.dart';
import '../utils/app_sizes.dart';

class HoverGlowText extends StatefulWidget {
  const HoverGlowText({
    super.key,
    required this.text,
    this.glowColor,
    this.onTap,
    this.maxGlow = 18,
    this.alwaysHighlight = false,
    this.duration = const Duration(milliseconds: 250),
  });

  final Text text;
  final Color? glowColor;
  final double maxGlow;
  final Duration duration;
  final VoidCallback? onTap;
  final bool alwaysHighlight;

  @override
  State<HoverGlowText> createState() => _HoverGlowTextState();
}

class _HoverGlowTextState extends State<HoverGlowText> {
  bool _hovered = false;

  @override
  void initState() {
    _hovered = widget.alwaysHighlight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.text.style ?? DefaultTextStyle.of(context).style;
    final glowColor = widget.glowColor ??
        textStyle.color ??
        Theme.of(context).colorScheme.primary;

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: widget.alwaysHighlight
          ? null
          : (_) => setState(() => _hovered = true),
      onExit: widget.alwaysHighlight
          ? null
          : (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.alwaysHighlight ? null : widget.onTap,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: _hovered ? widget.maxGlow : 0),
          duration: widget.duration,
          curve: Curves.easeOut,
          builder: (context, glow, _) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.spacingRegular,
                vertical: AppSizes.spacingSmall,
              ),
              child: Text(
                widget.text.data ?? '',
                style: textStyle.copyWith(
                  color: _hovered
                      ? glowColor
                      : textStyle.color ??
                          Theme.of(context).colorScheme.onSurface,
                  shadows: glow == 0
                      ? textStyle.shadows
                      : [
                          ...?textStyle.shadows,
                          Shadow(blurRadius: glow, color: glowColor),
                          Shadow(
                            blurRadius: glow * 1.5,
                            color: glowColor.withValues(alpha: 0.8),
                          ),
                          Shadow(
                            blurRadius: glow * 2.5,
                            color: glowColor.withValues(alpha: 0.5),
                          ),
                          Shadow(
                            blurRadius: glow * 3.5,
                            color: glowColor.withValues(alpha: 0.2),
                          ),
                        ],
                ),
                textAlign: widget.text.textAlign,
                maxLines: widget.text.maxLines,
                overflow: widget.text.overflow,
                softWrap: widget.text.softWrap,
              ),
            );
          },
        ),
      ),
    );
  }
}
