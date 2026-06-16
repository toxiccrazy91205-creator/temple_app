import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primarySaffron = Color(0xFFFF9933);
  static const Color vermillion = Color(0xFFE32636);
  static const Color marigoldGold = Color(0xFFFFD700);
  static const Color warmWhite = Color(0xFFFDFCF8);
  static const Color deepCharcoal = Color(0xFF1A1A1A);
  static const Color outlineVariant = Color(0xFFDBC2B0);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primarySaffron,
        secondary: vermillion,
        tertiary: marigoldGold,
        surface: warmWhite,
        onSurface: deepCharcoal,
      ),
      scaffoldBackgroundColor: warmWhite,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.sourceSerif4(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: deepCharcoal,
        ),
        displayMedium: GoogleFonts.sourceSerif4(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: deepCharcoal,
        ),
        headlineMedium: GoogleFonts.sourceSerif4(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: deepCharcoal,
        ),
        titleLarge: GoogleFonts.sourceSerif4(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: deepCharcoal,
        ),
        bodyLarge: GoogleFonts.beVietnamPro(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: deepCharcoal,
        ),
        bodyMedium: GoogleFonts.beVietnamPro(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: deepCharcoal,
        ),
        labelLarge: GoogleFonts.beVietnamPro(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        labelSmall: GoogleFonts.beVietnamPro(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: deepCharcoal,
          letterSpacing: 0.05,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: warmWhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: deepCharcoal),
        titleTextStyle: GoogleFonts.sourceSerif4(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: deepCharcoal,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primarySaffron,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9999), // Fully rounded as per design
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 2,
        ),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shadowColor: primarySaffron.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Large radius for cards
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: warmWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primarySaffron, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primarySaffron,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
