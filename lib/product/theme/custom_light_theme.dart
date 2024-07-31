import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/product/theme/custom_color_scheme.dart';
import 'package:task_app/product/theme/custom_theme.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.lexend().fontFamily,
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        textTheme: textTheme,
        bottomNavigationBarTheme: bottomNavigationBarThemeData,
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();

  @override
  TextTheme get textTheme => TextTheme(
        displaySmall: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4),
        displayMedium: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 48,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5),
        displayLarge: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 48,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.6),
        titleMedium: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 34.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4),
        titleSmall: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3),
        titleLarge: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4),
        headlineSmall: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2),
        headlineMedium: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3),
        headlineLarge: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3),
        bodySmall: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
        bodyMedium: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
        bodyLarge: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0),
        labelSmall: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0),
        labelMedium: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0),
        labelLarge: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            letterSpacing: 0),
      );

  @override
  BottomNavigationBarThemeData get bottomNavigationBarThemeData =>
      BottomNavigationBarThemeData(
        backgroundColor: CustomColorScheme.lightColorScheme.background,
        selectedItemColor: CustomColorScheme.lightColorScheme.primary,
        unselectedItemColor: CustomColorScheme.lightColorScheme.secondary,
        selectedLabelStyle: textTheme.bodyMedium,
        unselectedLabelStyle: textTheme.bodyMedium,
      );
}
