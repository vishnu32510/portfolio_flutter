import 'package:flutter/material.dart';
import 'package:particles_network/particles_network.dart';
import '../utils/app_extensions.dart';

class ParticleNetworkBackground extends StatelessWidget {
  const ParticleNetworkBackground({
    super.key,
    this.particleCount,
    this.maxSpeed = 0.5,
    this.maxSize = 1.5,
    this.lineWidth = 0.5,
    this.lineDistance = 140,
    this.particleColor,
    this.lineColor,
    this.touchColor,
    this.touchActivation = true,
    this.drawNetwork = true,
    this.fill = false,
    this.isComplex = false,
  });

  final int? particleCount;
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
    final isMobile = context.isMobile;

    // Adaptive particle density (saves >65% distance calculations on 60fps)
    final effectiveParticleCount = particleCount ?? (isMobile ? 38 : 72);

    final defaultParticleColor = theme.colorScheme.onSurface.withValues(
      alpha: 0.4,
    );
    final defaultLineColor = theme.colorScheme.primary.withValues(alpha: 0.2);
    final defaultTouchColor = theme.colorScheme.primary;

    // RepaintBoundary isolates background canvas painting from foreground widgets
    return RepaintBoundary(
      child: ParticleNetwork(
        particleCount: effectiveParticleCount,
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
    );
  }
}
