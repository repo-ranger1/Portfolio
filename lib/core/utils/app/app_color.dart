import 'package:flutter/material.dart';

class AppColor {
  const AppColor._();

  // Color(0xFFF8F8F8)Color(0xFFEEEEEE)
  // Light Theme Colors
  static const Color lightPrimary = Color(0xFF0D47A1);
  static const Color lightSecondary = Color(0xFF81D4FA);
  static const Color lightOnPrimary = Color(0xFFFFECDB);
  static const Color lightOnSecondary = Color(0xFF333333);
  static const Color lightError = Color(0xFFB00020);
  static const Color lightSurface = Color(0xFFFFFAFA);
  static const Color lightOnSurfaceVariant = Color(0xFF757575);
  static const Color lightOnSurface = Color(0xFF000000);
  static const Color lightOutline = Color(0xFFEEEEEE);
  static const Color lightOnError = Color(0xFFC80020);

  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF81D4FA);
  static const Color darkSecondary = Color(0xFF0D47A1);
  static const Color darkOnPrimary = Color(0xFF000000);
  static const Color darkOnSecondary = Color(0xFFbababa);
  static const Color darkError = Color(0xFFCF6679);
  static const Color darkSurface = Color(0xFF01151d);
  static const Color darkOnSurfaceVariant = Color(0xFF757575);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
  static const Color darkOutline = Color(0xFFEEEEEE);
  static const Color darkOnError = Color(0xFFC80020);

  /// The Light color scheme.
  static const ColorScheme light = ColorScheme(
    error: lightError,
    primary: lightPrimary,
    surface: lightSurface,
    onError: lightOnError,
    outline: lightOutline,
    secondary: lightSecondary,
    onSurface: lightOnSurface,
    onPrimary: lightOnPrimary,
    brightness: Brightness.light,
    onSecondary: lightOnSecondary,
    onSurfaceVariant: lightOnSurfaceVariant,
  );

  /// The Dark color scheme.
  static const ColorScheme dark = ColorScheme(
    error: darkError,
    primary: darkPrimary,
    outline: darkOutline,
    onError: darkOnError,
    surface: darkSurface,
    secondary: darkSecondary,
    onPrimary: darkOnPrimary,
    onSurface: darkOnSurface,
    brightness: Brightness.dark,
    onSecondary: darkOnSecondary,
    onSurfaceVariant: darkOnSurfaceVariant,
  );
}

// Enum for Single Colors with Names
enum ColorPair {
  // Dark Theme Colors
  royalIndigo("Royal Indigo", Color(0xFF3F51B5)),
  verdantSurge("Verdant Surge", Color(0xFF11AA58)),
  sapphireAbyss("Sapphire Abyss", Color(0xFF0D47A1)),

  // Light Theme Colors
  crystalSky("Crystal Sky", Color(0xFF81D4FA)),
  lavenderDream("Lavender Dream", Color(0xFFE1BEE7)),
  peachGlow("Peach Glow", Color(0xFFFFCCBC)),
  lemonFrost("Lemon Frost", Color(0xFFFFF59D));

  final String name;
  final Color color;

  const ColorPair(this.name, this.color);
}
