import 'package:flutter/material.dart';

/// A pulsing chevron-down arrow fixed at the bottom of the viewport.
/// It fades out once the user scrolls past the first screen height.
class ScrollDownHint extends StatefulWidget {
  const ScrollDownHint({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<ScrollDownHint> createState() => _ScrollDownHintState();
}

class _ScrollDownHintState extends State<ScrollDownHint>
    with SingleTickerProviderStateMixin {
  late final AnimationController _bounceController;
  late final Animation<double> _bounceAnim;

  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _bounceAnim = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );

    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = widget.scrollController.offset;
    // Fade out over the first 200px of scrolling
    final newOpacity = (1.0 - (offset / 200.0)).clamp(0.0, 1.0);
    if ((newOpacity - _opacity).abs() > 0.01) {
      setState(() => _opacity = newOpacity);
    }
  }

  @override
  void dispose() {
    _bounceController.dispose();
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_opacity == 0.0) return const SizedBox.shrink();

    final colors = Theme.of(context).colorScheme;

    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 150),
      child: GestureDetector(
        onTap: () {
          widget.scrollController.animateTo(
            widget.scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
          );
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedBuilder(
            animation: _bounceAnim,
            builder: (context, child) => Transform.translate(
              offset: Offset(0, _bounceAnim.value),
              child: child,
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.surface.withValues(alpha: 0.55),
                border: Border.all(
                  color: colors.outline.withValues(alpha: 0.5),
                ),
              ),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 22,
                color: colors.onSurface.withValues(alpha: 0.55),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
