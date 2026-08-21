import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_extensions.dart';

class InteractiveProfilePhoto extends StatefulWidget {
  const InteractiveProfilePhoto({super.key});

  @override
  State<InteractiveProfilePhoto> createState() =>
      _InteractiveProfilePhotoState();
}

class _InteractiveProfilePhotoState extends State<InteractiveProfilePhoto> {
  bool _isHovered = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Precache both images for instant, smooth cross-fading
    precacheImage(
      const AssetImage('assets/images/profile_animated.jpg'),
      context,
    );
    precacheImage(const AssetImage('assets/images/profile_real.jpg'), context);
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
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => setState(() => _isHovered = !_isHovered),
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
                // Real photo (base layer)
                Image.asset(
                  'assets/images/profile_real.jpg',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.35),
                ),

                // Animated illustration (top layer with smooth crossfade)
                AnimatedOpacity(
                  opacity: _isHovered ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutCubic,
                  child: Image.asset(
                    'assets/images/profile_animated.jpg',
                    fit: BoxFit.cover,
                    alignment: const Alignment(0, -0.35),
                  ),
                ),

                // Subtle interactive badge
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _isHovered
                                  ? Icons.camera_alt_rounded
                                  : Icons.auto_awesome_rounded,
                              size: 13,
                              color: _isHovered
                                  ? const Color(0xFF60A5FA)
                                  : const Color(0xFFFBBF24),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _isHovered ? 'Real Photo' : 'Hover to view',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 0.3,
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
      ),
    );
  }
}
