import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'grid_background.dart';
import 'particle_network_background.dart';

/// AsyncBackgroundStack loads backgrounds asynchronously to improve initial page load
/// Each background is wrapped in RepaintBoundary for performance isolation
class AsyncBackgroundStack extends StatefulWidget {
  const AsyncBackgroundStack({
    super.key,
    this.showParticleNetwork = true,
    this.showGrid = true,
    this.particleCount = 40,
    this.particleMaxSpeed = 0.3,
    this.particleLineDistance = 200,
  });

  final bool showParticleNetwork;
  final bool showGrid;
  final int particleCount;
  final double particleMaxSpeed;
  final double particleLineDistance;

  @override
  State<AsyncBackgroundStack> createState() => _AsyncBackgroundStackState();
}

class _AsyncBackgroundStackState extends State<AsyncBackgroundStack> {
  late final Future<void> _gridLoadFuture;
  late final Future<void> _particleLoadFuture;

  @override
  void initState() {
    super.initState();
    // Delay background loading to allow UI to render first
    // Grid loads first (lighter)
    _gridLoadFuture = Future.delayed(
      const Duration(milliseconds: 50),
      () {
        // Allow first frame to render
        SchedulerBinding.instance.addPostFrameCallback((_) {});
      },
    );

    // Particle network loads after grid (heavier)
    _particleLoadFuture = Future.delayed(
      const Duration(milliseconds: 300),
      () {
        // Load particle network after grid is ready
        SchedulerBinding.instance.addPostFrameCallback((_) {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Grid Background (lighter, loads first) - wrapped in RepaintBoundary
        if (widget.showGrid)
          FutureBuilder<void>(
            future: _gridLoadFuture,
            builder: (context, snapshot) {
              return RepaintBoundary(
                child: AnimatedOpacity(
                  opacity: snapshot.connectionState == ConnectionState.done ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: GridBackground(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.2),
                    strokeWidth: 0.5,
                    horizontalSpacing: 45,
                    verticalSpacing: 45,
                    runnerColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            },
          ),

        // Particle Network Background (heavier, loads after grid) - wrapped in RepaintBoundary
        if (widget.showParticleNetwork)
          FutureBuilder<void>(
            future: _particleLoadFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show nothing while loading to reduce initial render cost
                return const SizedBox.shrink();
              }

              return RepaintBoundary(
                child: AnimatedOpacity(
                  opacity: snapshot.connectionState == ConnectionState.done ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: ParticleNetworkBackground(
                    particleCount: widget.particleCount,
                    maxSpeed: widget.particleMaxSpeed,
                    maxSize: 1.5,
                    lineWidth: 0.5,
                    lineDistance: widget.particleLineDistance,
                    touchActivation: true,
                    drawNetwork: true,
                    fill: false,
                    isComplex: false,
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
