import 'package:flutter/material.dart';

/// Royal luxury color scheme for portfolio
/// Inspired by editorial design with deep backgrounds and gold accents
class AppColorRoyal {
  const AppColorRoyal._();

  // Primary Colors - Gold/Brass accents
  static const Color gold = Color(0xFFC9A86C);
  static const Color goldLight = Color(0xFFE8D5B7);
  static const Color goldDark = Color(0xFF8B7355);
  static const Color accent = Color(0xFFD4AF37);

  // Backgrounds - Deep and rich
  static const Color obsidian = Color(0xFF0A0A0A);
  static const Color charcoal = Color(0xFF1A1A1A);
  static const Color smoke = Color(0xFF2A2A2A);
  static const Color cream = Color(0xFFFAF7F2);

  // Text Colors
  static const Color mist = Color(0xFF888888);
  static const Color textPrimary = cream;
  static const Color textSecondary = mist;

  // Gradient Colors
  static const Color royalPurple = Color(0xFF2D1B4E);
  static const Color deepWine = Color(0xFF4A1942);

  // Gradients
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      royalPurple,
      deepWine,
      obsidian,
    ],
    stops: [0.0, 0.5, 1.0],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      gold,
      goldDark,
    ],
  );

  // Color Scheme
  static const ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: gold,
    onPrimary: obsidian,
    secondary: accent,
    onSecondary: obsidian,
    error: Color(0xFFCF6679),
    onError: obsidian,
    surface: charcoal,
    onSurface: cream,
  );
}
