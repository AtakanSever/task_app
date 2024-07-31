import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/product/theme/custom_color_scheme.dart';
import 'package:task_app/product/theme/custom_theme.dart';

/// Custom light theme for project design
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        textTheme: textTheme,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();

  @override
  TextTheme get textTheme => TextTheme(
        displaySmall: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4
        ),
        displayMedium: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 48,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5
        ),
        displayLarge: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 48,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.6
        ),
        titleMedium: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 34.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4
        ),
        titleSmall: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 28,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3
        ),
        titleLarge: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 40,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4
        ),
        headlineSmall: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2
        ),
        headlineMedium: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3
        ),
        headlineLarge: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 28,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3
        ),
        bodySmall: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0
        ),
        bodyMedium: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0
        ),
        bodyLarge: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0
        ),
        labelSmall: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0
        ),
        labelMedium: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0
        ),
        labelLarge: GoogleFonts.lexend(
          color: CustomColorScheme.lightColorScheme.background,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0
        ),
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      BottomNavigationBarThemeData(
        backgroundColor: CustomColorScheme.darkColorScheme.background,
        selectedItemColor: CustomColorScheme.darkColorScheme.primaryContainer,
        unselectedItemColor: CustomColorScheme.darkColorScheme.onPrimary,
        selectedLabelStyle: textTheme.bodyMedium,
        unselectedLabelStyle: textTheme.bodyMedium,
      );
}
