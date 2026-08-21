import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_extensions.dart';

class InteractiveProfilePhoto extends StatefulWidget {
  const InteractiveProfilePhoto({super.key});

  @override
  State<InteractiveProfilePhoto> createState() =>
      _InteractiveProfilePhotoState();
}

class _InteractiveProfilePhotoState extends State<InteractiveProfilePhoto>
    with TickerProviderStateMixin {
  Offset? _mousePosition;
  late AnimationController _revealController;
  late Animation<double> _revealAnimation;
  late AnimationController _fluidWaveController;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _revealController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _revealAnimation = CurvedAnimation(
      parent: _revealController,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    // Continuous subtle fluid surface tension wave animation
    _fluidWaveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
      const AssetImage('assets/images/profile_animated.jpg'),
      context,
    );
    precacheImage(const AssetImage('assets/images/profile_real.jpg'), context);
  }

  @override
  void dispose() {
    _revealController.dispose();
    _fluidWaveController.dispose();
    super.dispose();
  }

  void _onHover(PointerEvent event) {
    setState(() {
      _isHovered = true;
      _mousePosition = event.localPosition;
    });
    if (!_revealController.isAnimating && _revealController.value < 1.0) {
      _revealController.forward();
    }
  }

  void _onExit(PointerEvent event) {
    _revealController.reverse().then((_) {
      if (mounted) {
        setState(() {
          _isHovered = false;
          _mousePosition = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isMobile = context.isMobile;

    final photoWidth = isMobile
        ? (context.width * 0.75).clamp(240.0, 320.0)
        : (context.width * 0.24).clamp(260.0, 340.0);
    final photoHeight = photoWidth * 1.3;

    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onHover: _onHover,
      onEnter: _onHover,
      onExit: _onExit,
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            _mousePosition = details.localPosition;
          });
          if (_revealController.isCompleted) {
            _revealController.reverse();
          } else {
            _revealController.forward();
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          width: photoWidth,
          height: photoHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered
                  ? colors.primary.withValues(alpha: 0.8)
                  : colors.outline.withValues(alpha: 0.8),
              width: _isHovered ? 2.5 : 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? colors.primary.withValues(alpha: 0.25)
                    : Colors.black.withValues(alpha: 0.08),
                blurRadius: _isHovered ? 24 : 12,
                spreadRadius: _isHovered ? 2 : 0,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Base layer: Animated illustration avatar
                Image.asset(
                  'assets/images/profile_animated.jpg',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.35),
                ),

                // Top layer: Real Photo revealed through a dynamically morphing liquid blob
                AnimatedBuilder(
                  animation: Listenable.merge([
                    _revealAnimation,
                    _fluidWaveController,
                  ]),
                  builder: (context, child) {
                    final factor = _revealAnimation.value;
                    if (_mousePosition == null || factor <= 0.001) {
                      return const SizedBox.shrink();
                    }

                    // Dynamic organic blob radius
                    final currentRadius = 145.0 * factor;
                    final timePhase = _fluidWaveController.value * 2 * math.pi;

                    return ClipPath(
                      clipper: _DynamicMorphingBlobClipper(
                        center: _mousePosition!,
                        radius: currentRadius,
                        timePhase: timePhase,
                      ),
                      child: Image.asset(
                        'assets/images/profile_real.jpg',
                        fit: BoxFit.cover,
                        alignment: const Alignment(0, -0.35),
                      ),
                    );
                  },
                ),

                // Clean status pill at bottom right
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.55),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.25),
                            width: 0.8,
                          ),
                        ),
                        child: Text(
                          _isHovered ? 'Real Photo' : 'Hover to view',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Creates a dynamically morphing, liquid-like blob mask that changes shape
/// continuously based on cursor movement (X, Y) and fluid time oscillation.
class _DynamicMorphingBlobClipper extends CustomClipper<Path> {
  _DynamicMorphingBlobClipper({
    required this.center,
    required this.radius,
    required this.timePhase,
  });

  final Offset center;
  final double radius;
  final double timePhase;

  @override
  Path getClip(Size size) {
    if (radius <= 0.5) return Path();

    final path = Path();
    const numPoints = 12;
    final points = <Offset>[];

    // Derive spatial distortion phases from mouse coordinates
    final mousePhaseX = center.dx * 0.038;
    final mousePhaseY = center.dy * 0.032;

    for (int i = 0; i < numPoints; i++) {
      final theta = (i * 2 * math.pi) / numPoints;

      // Multi-frequency harmonic perturbation morphed by cursor position and fluid time
      final wave1 = 0.22 * math.sin(3 * theta + mousePhaseX + timePhase * 0.8);
      final wave2 = 0.16 * math.cos(4 * theta - mousePhaseY + timePhase * 1.1);
      final wave3 =
          0.10 * math.sin(2 * theta + (mousePhaseX - mousePhaseY) * 0.6);
      final wave4 =
          0.06 * math.cos(5 * theta + (center.dx + center.dy) * 0.015);

      final r = radius * (1.0 + wave1 + wave2 + wave3 + wave4);

      final x = center.dx + r * math.cos(theta);
      final y = center.dy + r * math.sin(theta);
      points.add(Offset(x, y));
    }

    // Form smooth spline curve using quadratic beziers
    final startMid = Offset(
      (points[0].dx + points[numPoints - 1].dx) / 2,
      (points[0].dy + points[numPoints - 1].dy) / 2,
    );
    path.moveTo(startMid.dx, startMid.dy);

    for (int i = 0; i < numPoints; i++) {
      final current = points[i];
      final next = points[(i + 1) % numPoints];
      final mid = Offset(
        (current.dx + next.dx) / 2,
        (current.dy + next.dy) / 2,
      );
      path.quadraticBezierTo(current.dx, current.dy, mid.dx, mid.dy);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _DynamicMorphingBlobClipper oldClipper) {
    return oldClipper.center != center ||
        oldClipper.radius != radius ||
        oldClipper.timePhase != timePhase;
  }
}
