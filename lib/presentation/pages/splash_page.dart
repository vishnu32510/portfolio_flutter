import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_constants.dart';
import '../../navigation/navigation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   // Keep splash snappy but smooth (target total: ~800–1200ms)
    //   duration: const Duration(milliseconds: 700),
    // );
    //
    // _fadeAnimation = Tween<double>(
    //   begin: 0.0,
    //   end: 1.0,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    //   ),
    // );
    //
    // _scaleAnimation = Tween<double>(
    //   begin: 0.9,
    //   end: 1.0,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.0, 0.8, curve: Curves.easeOutCubic),
    //   ),
    // );
    //
    // _controller.forward();
    //
    // _controller.addStatusListener((status) {
    //   if (status != AnimationStatus.completed) {
    //     return;
    //   }
    //   // Navigate to home shortly after animation completes
    //   _navigationTimer = Timer(const Duration(milliseconds: 150), () {
    //     if (!mounted) {
    //       return;
    //     }
    //     // Use pushReplacementNamed to replace splash with home
    //     // This ensures the route is properly replaced
    //     Navigator.of(context).pushReplacementNamed(
    //       Routes.home.route,
    //     );
    //   });
    // });
  }

  @override
  void dispose() {
    // _navigationTimer?.cancel();
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        // child: FadeTransition(
        //   opacity: _fadeAnimation,
        //   child: ScaleTransition(
        //     scale: _scaleAnimation,
        child: Hero(
          tag: AppConstants.heroTagAppIcon,
          child: Image.asset(
            AppAssets.appIcon,
            width: 120,
            height: 120,
          ),
        ),
        //   ),
        // ),
      ),
    );
  }
}
