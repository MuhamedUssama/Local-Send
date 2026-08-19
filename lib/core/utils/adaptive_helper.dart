import 'package:flutter/material.dart';

/// Enum representing the three primary screen categories supported in LocalSend.
enum DeviceScreenType {
  mobile,
  tablet,
  desktop;

  bool get isMobile => this == DeviceScreenType.mobile;
  bool get isTablet => this == DeviceScreenType.tablet;
  bool get isDesktop => this == DeviceScreenType.desktop;
}

/// Centralized Breakpoints for LocalSend UI adaptability.
abstract class AppBreakpoints {
  /// Width threshold below which the layout is considered Mobile (< 600dp).
  static const double mobileMax = 599.0;

  /// Width threshold for Tablet / iPad (600dp to 1023dp).
  static const double tabletMin = 600.0;
  static const double tabletMax = 1023.0;

  /// Width threshold for Desktop / Wide screens (>= 1024dp).
  static const double desktopMin = 1024.0;
}

/// Helper utility for resolving device screen types and responsive dimensions.
class AdaptiveHelper {
  const AdaptiveHelper._();

  /// Resolves the [DeviceScreenType] given a width.
  static DeviceScreenType getScreenTypeFromWidth(double width) {
    if (width >= AppBreakpoints.desktopMin) {
      return DeviceScreenType.desktop;
    } else if (width >= AppBreakpoints.tabletMin) {
      return DeviceScreenType.tablet;
    } else {
      return DeviceScreenType.mobile;
    }
  }

  /// Resolves the [DeviceScreenType] using [MediaQueryData].
  static DeviceScreenType getScreenType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return getScreenTypeFromWidth(width);
  }

  /// Returns a responsive value depending on the current screen type.
  static T getValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final screenType = getScreenType(context);
    switch (screenType) {
      case DeviceScreenType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceScreenType.tablet:
        return tablet ?? mobile;
      case DeviceScreenType.mobile:
        return mobile;
    }
  }
}

/// Ergonomic BuildContext extensions for quick adaptive queries in widgets.
extension AdaptiveContextX on BuildContext {
  /// Returns the [DeviceScreenType] for the current context.
  DeviceScreenType get screenType => AdaptiveHelper.getScreenType(this);

  /// Convenient boolean getters.
  bool get isMobile => screenType == DeviceScreenType.mobile;
  bool get isTablet => screenType == DeviceScreenType.tablet;
  bool get isDesktop => screenType == DeviceScreenType.desktop;

  /// True if the screen is tablet or larger (iPad, Foldable, Desktop, macOS/Windows/Linux).
  bool get isTabletOrDesktop => isTablet || isDesktop;

  /// Screen dimensions.
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  /// Screen orientation.
  Orientation get orientation => MediaQuery.orientationOf(this);
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  /// Adaptive value resolver on context directly.
  T adaptiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    return AdaptiveHelper.getValue<T>(
      this,
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}

/// A responsive widget builder that renders different widgets based on screen width.
///
/// Uses [LayoutBuilder] so it adapts to parent constraints when embedded in split-views
/// or dialogs, with an option to fall back to screen-wide [MediaQuery].
class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.useBoxConstraints = false,
  });

  /// Widget builder for mobile screens (< 600dp).
  final WidgetBuilder mobile;

  /// Widget builder for tablet / iPad screens (600dp - 1023dp). Defaults to [mobile].
  final WidgetBuilder? tablet;

  /// Widget builder for desktop / wide screens (>= 1024dp). Defaults to [tablet] or [mobile].
  final WidgetBuilder? desktop;

  /// If `true`, adapts based on the widget's parent box constraints instead of full window size.
  final bool useBoxConstraints;

  @override
  Widget build(BuildContext context) {
    if (useBoxConstraints) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final screenType = AdaptiveHelper.getScreenTypeFromWidth(constraints.maxWidth);
          switch (screenType) {
            case DeviceScreenType.desktop:
              return (desktop ?? tablet ?? mobile)(context);
            case DeviceScreenType.tablet:
              return (tablet ?? mobile)(context);
            case DeviceScreenType.mobile:
              return mobile(context);
          }
        },
      );
    }

    final screenType = context.screenType;
    switch (screenType) {
      case DeviceScreenType.desktop:
        return (desktop ?? tablet ?? mobile)(context);
      case DeviceScreenType.tablet:
        return (tablet ?? mobile)(context);
      case DeviceScreenType.mobile:
        return mobile(context);
    }
  }
}
