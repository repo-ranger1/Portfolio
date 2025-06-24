import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Size get size => MediaQuery.sizeOf(this);

  TextTheme get tt => Theme.of(this).textTheme;

  ColorScheme get cs => Theme.of(this).colorScheme;

  // AppLocalizations get locale =>
  //     AppLocalizations.of(this) ?? AppLocaleFallback("en");

  /// Push a page.
  Future<T?> push<T extends Object>({required final Widget page}) async {
    return await Navigator.of(this).push<T>(pageRoute<T>(page));
  }

  /// Pop a page.
  void pop<T extends Object>([T? result]) => Navigator.of(this).pop(result);

  /// The material page route.
  MaterialPageRoute<T> pageRoute<T extends Object>(final Widget page) {
    return MaterialPageRoute<T>(builder: (_) => page);
  }
}
