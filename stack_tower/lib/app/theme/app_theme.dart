import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Keep background images handled by screens
      scaffoldBackgroundColor: Colors.transparent,

      textTheme: TextTheme(
        displayLarge: GoogleFonts.orbitron(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
        titleLarge: GoogleFonts.orbitron(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: GoogleFonts.exo2(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: GoogleFonts.exo2(
          color: Colors.white70,
        ),
      ),

      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
    );
  }
}