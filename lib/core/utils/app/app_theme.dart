import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_fonts.dart';

///Meditab Software Inc. CONFIDENTIAL
///__________________
///
/// [2025] Meditab Software Inc.
/// All Rights Reserved.
///
///NOTICE:  All information contained herein is, and remains
///the property of Meditab Software Inc. and its suppliers,
///if any.  The intellectual and technical concepts contained
///herein are proprietary to Meditab Software Incorporated
///and its suppliers and may be covered by U.S. and Foreign Patents,
///patents in process, and are protected by trade secret or copyright law.
///Dissemination of this information or reproduction of this material
///is strictly forbidden unless prior written permission is obtained
///from Meditab Software Incorporated.
///
///File Name: app_theme
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 08/05/25 14:31

abstract class AppTheme {
  /// region App Light theme.
  static final ThemeData light = ThemeData(
    // Material theme
    useMaterial3: true,

    // The color scheme.
    colorScheme: AppColor.light,

    // The font family.
    fontFamily: AppFonts.secondary,

    // The scaffold background color.
    scaffoldBackgroundColor: AppColor.lightSurface,

    // The text themes.
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.primary,
        color: AppColor.lightOnSecondary,
      ),
      titleMedium: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.secondary,
        color: AppColor.lightOnSecondary,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        fontFamily: AppFonts.secondary,
        color: AppColor.lightOnSecondary.withAlpha(200),
      ),
      labelSmall: TextStyle(
        fontSize: 14.0,
        fontFamily: AppFonts.secondary,
        color: AppColor.lightOnSecondary.withAlpha(200),
      ),
    ),

    /// region Light theme constants
    // AppBar theme constant
    appBarTheme: AppBarTheme(
      elevation: 1,
      titleSpacing: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.primary,
        color: AppColor.lightOnSecondary,
      ),
      backgroundColor: AppColor.lightOnPrimary,
      surfaceTintColor: AppColor.lightOnPrimary,
      shadowColor: AppColor.lightOnSurfaceVariant.withAlpha(120),
      iconTheme: const IconThemeData(color: AppColor.lightOnSecondary),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
    ),

    // Input field decoration theme.
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      filled: true,
      fillColor: AppColor.lightOnSurfaceVariant.withAlpha(20),
      hintStyle: const TextStyle(color: AppColor.lightOnSurfaceVariant),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red.withAlpha(220)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
    ),

    // Elevated button theme.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColor.lightPrimary.withAlpha(80);
          }
          return AppColor.lightPrimary;
        }),
        elevation: WidgetStateProperty.all<double>(0.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(
          AppColor.lightOnPrimary,
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    ),

    // The Card theme.
    cardTheme: const CardTheme(
      elevation: 0,
      color: AppColor.lightOnPrimary,
      margin: EdgeInsets.all(0),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),

    /// The outlined button.
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColor.lightOutline;
          }
          return AppColor.lightOnPrimary;
        }),
        elevation: WidgetStateProperty.all<double>(0.0),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: AppColor.lightPrimary),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColor.lightOnSecondary;
          }
          return AppColor.lightPrimary;
        }),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    ),

    // The Checkbox theme.
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    ),

    // The divider theme
    dividerTheme: const DividerThemeData(
      thickness: 2,
      color: AppColor.lightOutline,
    ),
    listTileTheme: ListTileThemeData(
      dense: true,
      tileColor: AppColor.lightOnPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      titleTextStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.secondary,
        color: AppColor.lightOnSecondary,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.secondary,
        color: AppColor.lightOnSecondary.withAlpha(200),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColor.lightPrimary,
      borderRadius: BorderRadius.circular(0),
      linearTrackColor: AppColor.lightOnSurfaceVariant.withAlpha(40),
    ),
  );

  /// endregion

  /// region App dark theme.
  static final ThemeData dark = ThemeData(
    // Material theme
    useMaterial3: true,

    // The color scheme.
    colorScheme: AppColor.dark,

    // The font family.
    fontFamily: AppFonts.secondary,

    // The scaffold background color.
    scaffoldBackgroundColor: AppColor.darkSurface,

    // The text themes.
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.primary,
        color: AppColor.darkOnSecondary,
      ),
      titleMedium: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.secondary,
        color: AppColor.darkOnSecondary,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        fontFamily: AppFonts.secondary,
        color: AppColor.darkOnSecondary.withAlpha(200),
      ),
      labelSmall: TextStyle(
        fontSize: 14.0,
        fontFamily: AppFonts.secondary,
        color: AppColor.darkOnSecondary.withAlpha(200),
      ),
    ),

    /// region dark theme constants
    // AppBar theme constant
    appBarTheme: AppBarTheme(
      elevation: 1,
      titleSpacing: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.primary,
        color: AppColor.darkOnSecondary,
      ),
      backgroundColor: AppColor.darkOnPrimary,
      surfaceTintColor: AppColor.darkOnPrimary,
      shadowColor: AppColor.darkOnSurfaceVariant.withAlpha(120),
      iconTheme: const IconThemeData(color: AppColor.darkOnSecondary),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
    ),

    // Input field decoration theme.
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      filled: true,
      fillColor: AppColor.lightOnSurfaceVariant.withAlpha(20),
      hintStyle: const TextStyle(color: AppColor.darkOnSurfaceVariant),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red.withAlpha(220)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
    ),

    // Elevated button theme.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColor.darkPrimary.withAlpha(80);
          }
          return AppColor.darkPrimary;
        }),
        elevation: WidgetStateProperty.all<double>(0.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        foregroundColor: WidgetStateProperty.all<Color>(AppColor.darkOnPrimary),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    ),

    // The Card theme.
    cardTheme: const CardTheme(
      elevation: 0,
      color: AppColor.darkOnPrimary,
      margin: EdgeInsets.all(0),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),

    /// The outlined button.
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColor.darkOutline;
          }
          return AppColor.darkOnPrimary;
        }),
        elevation: WidgetStateProperty.all<double>(0.0),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: Colors.transparent),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColor.darkOnSecondary;
          }
          return AppColor.darkPrimary;
        }),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    ),

    // The Checkbox theme.
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    ),

    //
    dividerTheme: const DividerThemeData(
      thickness: 2,
      color: AppColor.darkOnPrimary,
    ),

    listTileTheme: ListTileThemeData(
      dense: true,
      tileColor: AppColor.darkOnPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      titleTextStyle: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.secondary,
        color: AppColor.darkOnSecondary,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.secondary,
        color: AppColor.darkOnSecondary.withAlpha(200),
      ),
    ),
  );

  /// endregion
}
