import 'package:flutter/material.dart';

class AppColors {
  static const Color farmGreen = Color(0xFF2F6F4E);
  static const Color deepNavy = Color(0xFF1B2A4A);
  static const Color teal = Color(0xFF1F7A8C);
  static const Color lightGray = Color(0xFFF3F5F7);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFF3D8B6E);
  static const Color warning = Color(0xFFB45309);
  static const Color danger = Color(0xFFB42318);
  static const Color expert = Color(0xFF334155);
  static const Color field = Color(0xFF0F766E);
}

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.farmGreen,
        primary: AppColors.farmGreen,
        secondary: AppColors.teal,
        surface: AppColors.cardWhite,
      ),
      scaffoldBackgroundColor: AppColors.lightGray,
    );

    return base.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.deepNavy,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.black.withValues(alpha: 0.06)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: AppColors.cardWhite,
        selectedIconTheme: IconThemeData(color: AppColors.farmGreen),
        selectedLabelTextStyle: TextStyle(
          color: AppColors.farmGreen,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
