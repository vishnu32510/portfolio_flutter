import 'package:flutter/material.dart';
import 'package:particles_network/particles_network.dart';

class ParticleNetworkBackground extends StatelessWidget {
  const ParticleNetworkBackground({
    super.key,
    this.particleCount = 120,
    this.maxSpeed = 0.5,
    this.maxSize = 1.5,
    this.lineWidth = 0.5,
    this.lineDistance = 150,
    this.particleColor,
    this.lineColor,
    this.touchColor,
    this.touchActivation = true,
    this.drawNetwork = true,
    this.fill = false,
    this.isComplex = false,
  });

  final int particleCount;
  final double maxSpeed;
  final double maxSize;
  final double lineWidth;
  final double lineDistance;
  final Color? particleColor;
  final Color? lineColor;
  final Color? touchColor;
  final bool touchActivation;
  final bool drawNetwork;
  final bool fill;
  final bool isComplex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultParticleColor = theme.colorScheme.onSurface.withValues(alpha: 0.4);
    final defaultLineColor = theme.colorScheme.primary.withValues(alpha: 0.2);
    final defaultTouchColor = theme.colorScheme.primary;

    return Listener(
      // Listener captures all pointer events including mouse movement
      // Using opaque behavior to ensure events are captured
      behavior: HitTestBehavior.opaque,
      onPointerMove: (event) {
        // Pointer movement is tracked - ParticleNetwork handles it internally
        // The event will bubble down to ParticleNetwork
      },
      onPointerDown: (event) {
        // Ensure pointer down events are captured for touch interaction
      },
      child: MouseRegion(
        // MouseRegion ensures mouse events are properly tracked
        onHover: (_) {
          // Mouse hover is tracked
        },
        child: ParticleNetwork(
          particleCount: particleCount,
          maxSpeed: maxSpeed,
          maxSize: maxSize,
          lineWidth: lineWidth,
          lineDistance: lineDistance,
          particleColor: particleColor ?? defaultParticleColor,
          lineColor: lineColor ?? defaultLineColor,
          touchColor: touchColor ?? defaultTouchColor,
          touchActivation: touchActivation,
          drawNetwork: drawNetwork,
          fill: fill,
          isComplex: isComplex,
        ),
      ),
    );
  }
}
