import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [Device] will do two operations..
///
/// 1. checks the device type and set the orientation accordingly
///    [Landscape] if the device is [Tablet] (android tabs, apple ipads)
///    [Portrait] if the device is [Mobile] (android mobiles, apple iPhones).
///
/// 2. find the device width and height
///    and will store in in the [AppConsts] for further usage.

final class Device {
  static final Device _singleton = Device._internal();

  factory Device() => _singleton;

  Device._internal();

  bool isMobile = false;

  double height = 0;
  double width = 0;

  void init(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final Orientation orientation = mediaQueryData.orientation;

    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;

    final double deviceWidth =
        orientation == Orientation.landscape
            ? mediaQueryData.size.height
            : mediaQueryData.size.width;

    // If the device's width is greater than 600.
    if (deviceWidth > 600) {
      // device is desktop.
      isMobile = false;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    // Device's width is less than 600.
    else {
      // device is mobile.
      isMobile = true;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  /// Return value according to the device.
  T accordingValue<T>({required T mobile, required T desktop}) =>
      isMobile ? mobile : desktop;
}
