import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: const MaterialColor(
      0xFF000000,
      <int, Color>{
        50: Color(0xFF000000),
        100: Color(0xFF121212),
        200: Color(0xFF3D3D3D),
        300: Color(0xFF656565),
        400: Color(0xFFABABAB),
        500: Color(0xFFDBDBDB),
        600: Color(0xFFECECEC),
        700: Color(0xFFFAFAFA),
        800: Color(0xFFFFFFFF),
      },
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w300,
        letterSpacing: 1,
        color: Color(0xFF121212),
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: Color(0xFF3D3D3D),
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w300,
        color: Color(0xFF121212),
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Color(0xFF121212),
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF3D3D3D),
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF121212),
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF3D3D3D),
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFF121212),
      ),
    ),
  );
}
