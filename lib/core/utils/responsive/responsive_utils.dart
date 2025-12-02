import 'package:flutter/material.dart';

/// Responsive utility class for handling dynamic sizing across different screen sizes.
/// This class provides methods for responsive spacing, font sizes, and general sizing
/// that adapts to mobile, tablet, and desktop screens.
class ResponsiveUtils {
  const ResponsiveUtils._();

  // Breakpoints for different screen sizes
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;

  /// Get screen type based on width
  static ScreenType getScreenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < mobileBreakpoint) {
      return ScreenType.mobile;
    } else if (width < tabletBreakpoint) {
      return ScreenType.tablet;
    } else {
      return ScreenType.desktop;
    }
  }

  /// Check if current screen is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  /// Check if current screen is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Check if current screen is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreakpoint;
  }

  /// Get responsive value based on screen type
  static T valueByScreen<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    final screenType = getScreenType(context);
    switch (screenType) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet ?? desktop;
      case ScreenType.desktop:
        return desktop;
    }
  }

  /// Calculate responsive font size based on screen width
  /// Uses a scaling factor relative to design base width (1440px for desktop)
  static double fontSize(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    final screenType = getScreenType(context);

    switch (screenType) {
      case ScreenType.mobile:
        // Much better mobile scaling - larger minimum sizes
        // For very large text (like hero), scale more aggressively down
        // For normal text, keep it readable
        if (baseSize > 100) {
          // Large display text (hero titles)
          final scale = (width / mobileBreakpoint).clamp(0.4, 0.65);
          return baseSize * scale;
        } else if (baseSize > 40) {
          // Medium titles
          final scale = (width / mobileBreakpoint).clamp(0.5, 0.75);
          return baseSize * scale;
        } else {
          // Body text and smaller - keep very readable
          final scale = (width / mobileBreakpoint).clamp(0.8, 1.1);
          return (baseSize * scale).clamp(baseSize * 0.7, baseSize * 1.1);
        }
      case ScreenType.tablet:
        // Scale moderately for tablet
        final scale = (width / desktopBreakpoint).clamp(0.5, 0.85);
        return (baseSize * scale).clamp(baseSize * 0.45, baseSize * 0.85);
      case ScreenType.desktop:
        // Scale proportionally for desktop, with reasonable bounds
        final scale = (width / desktopBreakpoint).clamp(0.7, 1.3);
        return baseSize * scale;
    }
  }

  /// Calculate responsive spacing/padding
  static double spacing(BuildContext context, double baseSpacing) {
    final width = MediaQuery.of(context).size.width;
    final screenType = getScreenType(context);

    switch (screenType) {
      case ScreenType.mobile:
        // Better mobile spacing - not too cramped
        final scale = (width / mobileBreakpoint).clamp(0.6, 0.9);
        return (baseSpacing * scale).clamp(baseSpacing * 0.5, baseSpacing);
      case ScreenType.tablet:
        return baseSpacing * (width / desktopBreakpoint) * 0.75;
      case ScreenType.desktop:
        final scale = (width / desktopBreakpoint).clamp(0.8, 1.2);
        return baseSpacing * scale;
    }
  }

  /// Calculate responsive width percentage
  static double widthPercent(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * (percent / 100);
  }

  /// Calculate responsive height percentage
  static double heightPercent(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * (percent / 100);
  }

  /// Get responsive horizontal padding
  static EdgeInsets responsiveHorizontalPadding(BuildContext context) {
    final screenType = getScreenType(context);
    switch (screenType) {
      case ScreenType.mobile:
        return EdgeInsets.symmetric(
          horizontal: widthPercent(context, 5),
        );
      case ScreenType.tablet:
        return EdgeInsets.symmetric(
          horizontal: widthPercent(context, 8),
        );
      case ScreenType.desktop:
        return EdgeInsets.symmetric(
          horizontal: widthPercent(context, 10),
        );
    }
  }

  /// Get responsive vertical padding
  static EdgeInsets responsiveVerticalPadding(BuildContext context) {
    final screenType = getScreenType(context);
    switch (screenType) {
      case ScreenType.mobile:
        return EdgeInsets.symmetric(
          vertical: heightPercent(context, 5),
        );
      case ScreenType.tablet:
        return EdgeInsets.symmetric(
          vertical: heightPercent(context, 8),
        );
      case ScreenType.desktop:
        return EdgeInsets.symmetric(
          vertical: heightPercent(context, 10),
        );
    }
  }

  /// Get responsive padding for all sides
  static EdgeInsets responsivePadding(BuildContext context) {
    final screenType = getScreenType(context);
    switch (screenType) {
      case ScreenType.mobile:
        return EdgeInsets.symmetric(
          horizontal: widthPercent(context, 5),
          vertical: heightPercent(context, 5),
        );
      case ScreenType.tablet:
        return EdgeInsets.symmetric(
          horizontal: widthPercent(context, 8),
          vertical: heightPercent(context, 8),
        );
      case ScreenType.desktop:
        return EdgeInsets.symmetric(
          horizontal: widthPercent(context, 10),
          vertical: heightPercent(context, 10),
        );
    }
  }
}

/// Screen type enum
enum ScreenType {
  mobile,
  tablet,
  desktop,
}

/// Extension on BuildContext for easier access to responsive utilities
extension ResponsiveContext on BuildContext {
  /// Get screen type
  ScreenType get screenType => ResponsiveUtils.getScreenType(this);

  /// Check if mobile
  bool get isMobile => ResponsiveUtils.isMobile(this);

  /// Check if tablet
  bool get isTablet => ResponsiveUtils.isTablet(this);

  /// Check if desktop
  bool get isDesktop => ResponsiveUtils.isDesktop(this);

  /// Get responsive font size
  double sp(double baseSize) => ResponsiveUtils.fontSize(this, baseSize);

  /// Get responsive spacing
  double spacing(double baseSpacing) =>
      ResponsiveUtils.spacing(this, baseSpacing);

  /// Get width percentage
  double wp(double percent) => ResponsiveUtils.widthPercent(this, percent);

  /// Get height percentage
  double hp(double percent) => ResponsiveUtils.heightPercent(this, percent);

  /// Get responsive horizontal padding
  EdgeInsets get responsiveHPadding =>
      ResponsiveUtils.responsiveHorizontalPadding(this);

  /// Get responsive vertical padding
  EdgeInsets get responsiveVPadding =>
      ResponsiveUtils.responsiveVerticalPadding(this);

  /// Get responsive padding
  EdgeInsets get responsivePadding => ResponsiveUtils.responsivePadding(this);

  /// Get value by screen type
  T byScreen<T>({
    required T mobile,
    T? tablet,
    required T desktop,
  }) =>
      ResponsiveUtils.valueByScreen(
        this,
        mobile: mobile,
        tablet: tablet,
        desktop: desktop,
      );
}
