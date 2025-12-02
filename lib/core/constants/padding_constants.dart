import 'package:flutter/cupertino.dart';

/// DEPRECATED: Use ResponsiveUtils instead for dynamic padding
/// For responsive design, use context.responsivePadding,
/// context.responsiveHPadding, or context.responsiveVPadding
/// from ResponsiveContext extension.
@Deprecated('Use ResponsiveUtils for dynamic padding')
class PaddingC {
  const PaddingC._();
  static const EdgeInsets defaultPx = EdgeInsets.all(16);
}
