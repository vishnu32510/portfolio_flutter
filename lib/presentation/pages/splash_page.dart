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

class _SplashPageState extends State<SplashPage>{
  // with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _fadeAnimation;
  // late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   // Keep splash snappy (target total: ~800–1200ms)
    //   duration: const Duration(milliseconds: 200),
    // );

    // _fadeAnimation = Tween<double>(
    //   begin: 0.0,
    //   end: 1.0,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
    //   ),
    // );

    // _scaleAnimation = Tween<double>(
    //   begin: 0.5,
    //   end: 1.0,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
    //   ),
    // );

    // _controller.forward();

    // Navigate to home shortly after animation completes
    navigavetToHome();
  }

  void navigavetToHome() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(Routes.home.route);
      }
    });
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Hero(
          tag: AppConstants.heroTagAppIcon,
          child: Image.asset(
            AppAssets.appIcon,
            width: 120,
            height: 120,
          ),
        ),
        // child: FadeTransition(
        //   opacity: _fadeAnimation,
        //   child: ScaleTransition(
        //     scale: _scaleAnimation,
        //     child: Hero(
        //       tag: AppConstants.heroTagAppIcon,
        //       child: Image.asset(
        //         AppAssets.appIcon,
        //         width: 120,
        //         height: 120,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
