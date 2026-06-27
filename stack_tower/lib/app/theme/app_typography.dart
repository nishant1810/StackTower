import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle titleLarge = GoogleFonts.orbitron(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static TextStyle titleMedium = GoogleFonts.orbitron(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static TextStyle bodyLarge = GoogleFonts.exo2(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle bodyMedium = GoogleFonts.exo2(
    fontSize: 14,
    color: Colors.white70,
  );
}