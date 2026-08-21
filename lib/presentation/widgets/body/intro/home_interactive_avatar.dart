import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../generated/assets.dart';

class HomeInteractiveAvatar extends StatefulWidget {
  const HomeInteractiveAvatar({super.key});

  @override
  State<HomeInteractiveAvatar> createState() => _HomeInteractiveAvatarState();
}

class _HomeInteractiveAvatarState extends State<HomeInteractiveAvatar>
    with TickerProviderStateMixin {
  // Retains walk completion across tab switches and section navigation
  static bool _hasPlayedIntroOnce = false;

  late AnimationController _walkController;
  late Animation<double> _walkScale;
  late Animation<double> _walkOpacity;
  late Animation<Offset> _walkSlide;
  late AnimationController _idleBreathController;

  late bool _isWalkComplete;

  @override
  void initState() {
    super.initState();
    _isWalkComplete = _hasPlayedIntroOnce;

    // Initialize controller at end (1.0) if intro already played in this session
    _walkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
      value: _hasPlayedIntroOnce ? 1.0 : 0.0,
    );

    _walkScale = Tween<double>(begin: 0.72, end: 1.0).animate(
      CurvedAnimation(
        parent: _walkController,
        curve: const Interval(0.0, 0.9, curve: Curves.easeOutCubic),
      ),
    );

    _walkOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _walkController,
        curve: const Interval(0.0, 0.25, curve: Curves.easeIn),
      ),
    );

    _walkSlide = Tween<Offset>(begin: const Offset(0.0, 0.15), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _walkController,
            curve: const Interval(0.0, 0.9, curve: Curves.easeOutCubic),
          ),
        );

    // Subtle gentle idle breathing motion once walking is complete
    _idleBreathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
    )..repeat(reverse: true);

    // Only auto-play on first initial visit; on tab switch remain in standing pose
    if (!_hasPlayedIntroOnce) {
      _walkController
          .forward()
          .then((_) {
            _hasPlayedIntroOnce = true;
            if (mounted) {
              setState(() {
                _isWalkComplete = true;
              });
            }
          })
          .catchError((_) {
            _hasPlayedIntroOnce = true;
            if (mounted) {
              setState(() {
                _isWalkComplete = true;
              });
            }
          });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache walk cycle frames for instant, buttery-smooth playback
    precacheImage(const AssetImage(Assets.imagesWalkDarkF1), context);
    precacheImage(const AssetImage(Assets.imagesWalkDarkF2), context);
    precacheImage(const AssetImage(Assets.imagesWalkDarkF3), context);
    precacheImage(const AssetImage(Assets.imagesWalkDarkF4), context);
  }

  @override
  void dispose() {
    _walkController.dispose();
    _idleBreathController.dispose();
    super.dispose();
  }

  void _replayWalk() {
    setState(() {
      _isWalkComplete = false;
    });
    _walkController.reset();
    _walkController
        .forward()
        .then((_) {
          _hasPlayedIntroOnce = true;
          if (mounted) {
            setState(() {
              _isWalkComplete = true;
            });
          }
        })
        .catchError((_) {
          _hasPlayedIntroOnce = true;
          if (mounted) {
            setState(() {
              _isWalkComplete = true;
            });
          }
        });
  }

  /// Calculates current walking frame based on walkProgress (0.0 to 1.0)
  String _getActiveFrameAsset(double progress) {
    if (_isWalkComplete || progress >= 0.88 || _walkController.isCompleted) {
      // Final planted standing frame
      return Assets.imagesWalkDarkF4;
    }

    // Step cycle repeats during entrance: (f1 -> f2 -> f3 -> f2 -> f1)
    final cycleValue = (progress * 5.0) % 4.0;
    final frameIndex = cycleValue.floor();

    switch (frameIndex) {
      case 0:
        return Assets.imagesWalkDarkF1;
      case 1:
        return Assets.imagesWalkDarkF2;
      case 2:
        return Assets.imagesWalkDarkF3;
      case 3:
        return Assets.imagesWalkDarkF2;
      default:
        return Assets.imagesWalkDarkF4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = context.isMobile;

    final avatarWidth = isMobile
        ? (context.width * 0.65).clamp(210.0, 300.0)
        : (context.width * 0.26).clamp(270.0, 380.0);
    final avatarHeight = avatarWidth * 1.48;

    return RepaintBoundary(
      child: GestureDetector(
        onTap: _replayWalk,
        child: SizedBox(
          width: avatarWidth,
          height: avatarHeight,
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              // Walk-In Entrance Animation (Black Suit with Formal Shoes)
              AnimatedBuilder(
                animation: Listenable.merge([
                  _walkController,
                  _idleBreathController,
                ]),
                builder: (context, child) {
                  final progress = _walkController.value;

                  // Subtle vertical stride bounce during active walking steps
                  final strideBounce = _isWalkComplete
                      ? (_idleBreathController.value * 3.0)
                      : (math.sin(progress * 4.0 * math.pi).abs() *
                            (1.0 - progress) *
                            7.0);

                  final activeAsset = _getActiveFrameAsset(progress);

                  return Transform.translate(
                    offset: Offset(
                      0,
                      _walkSlide.value.dy * avatarHeight - strideBounce,
                    ),
                    child: Transform.scale(
                      scale: _walkScale.value,
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                        opacity: _walkOpacity.value,
                        child: Image.asset(
                          activeAsset,
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  );
                },
              ),

              // Subtle replay button in bottom corner
              if (_isWalkComplete)
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _replayWalk,
                      borderRadius: BorderRadius.circular(20),
                      hoverColor: theme.colorScheme.primary.withValues(
                        alpha: 0.15,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: (isDark ? Colors.black : Colors.white)
                              .withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: theme.colorScheme.primary.withValues(
                              alpha: 0.35,
                            ),
                            width: 0.8,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.replay_rounded,
                              size: 13,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Walk In',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
