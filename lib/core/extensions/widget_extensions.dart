import 'package:flutter/material.dart';

import '../utils/device/device_config.dart';

extension WidgetExtensions on Widget {
  Widget get parentWidth => SizedBox(width: Device().width, child: this);

  Widget get parentHeight => SizedBox(height: Device().height, child: this);

  Widget get center => Center(child: this);

  Widget expand({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget withSize({required double height, required double width}) =>
      SizedBox(width: width, height: height, child: this);

  Widget withHeight(double height) => SizedBox(height: height, child: this);

  Widget withWidth(double width) => SizedBox(width: width, child: this);
}
