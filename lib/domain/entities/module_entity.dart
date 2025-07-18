import 'package:flutter/material.dart';

/// Represents a module entity with the following parameters:
/// - [page]: The main widget of the module.
/// - [title]: The display title of the module.
/// - [key]: GlobalKey assigned to the module, used for scrolling into view.
class ModuleEntity {
  final Widget page;
  final String title;
  final GlobalKey key;

  const ModuleEntity({
    required this.key,
    required this.page,
    required this.title,
  });
}
