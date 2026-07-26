import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/router/routes_name.dart';
import '../widgets/splash_logo_widget.dart';
import '../widgets/splash_progress_widget.dart';
import '../widgets/splash_title_widget.dart';

/// Helper getter to check if app is running on macOS or Windows
bool get isDesktopPlatform =>
    !kIsWeb && (Platform.isMacOS || Platform.isWindows);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
    );

    _pulseAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isDesktopPlatform) {
        // Non-desktop platforms (Android/iOS/Web) skip splash screen immediately
        Navigator.pushReplacementNamed(context, RoutesName.home);
      } else {
        // Desktop platforms (macOS / Windows) show splash screen for 2.5 seconds
        Future.delayed(const Duration(milliseconds: 2500), () {
          if (mounted) {
            Navigator.pushReplacementNamed(context, RoutesName.home);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If not desktop, return lightweight placeholder while navigating immediately
    if (!isDesktopPlatform) {
      return const Scaffold();
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SplashLogoWidget(
                scaleAnimation: _scaleAnimation,
                pulseAnimation: _pulseAnimation,
              ),
              const SizedBox(height: 28),
              SplashTitleWidget(fadeAnimation: _fadeAnimation),
              const Spacer(),
              SplashProgressWidget(fadeAnimation: _fadeAnimation),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
