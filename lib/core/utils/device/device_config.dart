import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [Device] will detect device type and set orientation accordingly.
///
/// Supports three device types:
/// - [Mobile]: width < 600 (Portrait orientation)
/// - [Tablet]: width >= 600 and < 1024 (Flexible orientation)
/// - [Desktop]: width >= 1024 (Landscape orientation)
///
/// Also stores device width and height for easy access throughout the app.

enum DeviceType { mobile, tablet, desktop }

final class Device {
  static final Device _singleton = Device._internal();

  factory Device() => _singleton;

  Device._internal();

  // Breakpoints matching ResponsiveUtils
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;

  DeviceType deviceType = DeviceType.desktop;

  bool get isMobile => deviceType == DeviceType.mobile;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;

  double height = 0;
  double width = 0;

  void init(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final Orientation orientation = mediaQueryData.orientation;

    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;

    final double deviceWidth = orientation == Orientation.landscape
        ? mediaQueryData.size.height
        : mediaQueryData.size.width;

    // Determine device type based on width
    if (deviceWidth < mobileBreakpoint) {
      // Mobile device
      deviceType = DeviceType.mobile;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else if (deviceWidth < tabletBreakpoint) {
      // Tablet device
      deviceType = DeviceType.tablet;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      // Desktop device
      deviceType = DeviceType.desktop;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }

  /// Return value according to the device type.
  T accordingValue<T>({
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? desktop;
      case DeviceType.desktop:
        return desktop;
    }
  }
}
