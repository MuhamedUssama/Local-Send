import 'package:flutter/material.dart';
import '../../features/splash/screen/splash_screen.dart';
import '../../features/theme_test/theme_test_screen.dart';
import 'routes_name.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return _buildFadeRoute(const SplashScreen(), settings);
      case RoutesName.themeTest:
      case RoutesName.home:
        return _buildFadeScaleRoute(
          ThemeTestScreen(
            onToggleTheme: () {},
            isDarkMode: true,
            onToggleLanguage: () {},
            currentLocale: const Locale('en'),
          ),
          settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  /// Builds a smooth FadePageRoute transition
  static PageRouteBuilder _buildFadeRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeIn,
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    );
  }

  /// Builds a premium Fade + Scale route transition
  static PageRouteBuilder _buildFadeScaleRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curveAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        );

        return FadeTransition(
          opacity: curveAnimation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.96, end: 1.0).animate(curveAnimation),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
