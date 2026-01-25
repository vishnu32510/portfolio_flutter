import 'package:flutter/material.dart';
import '../../../core/widgets/async_background_stack.dart';
import '../app_bar/home_app_bar.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: const HomeAppBar(),
      body: Stack(
        children: [
          // Persistent background shared across all pages
          Positioned.fill(
            child: AsyncBackgroundStack(
              showParticleNetwork: true,
              showGrid: true,
              particleCount: (MediaQuery.of(context).size.width / 20).clamp(30, 100).toInt(),
              particleMaxSpeed: 0.5,
              particleLineDistance: 150,
              touchActivation: false,
            ),
          ),
          // Content changes here
          Positioned.fill(
            child: child,
          ),
        ],
      ),
    );
  }
}
