import 'package:flutter/material.dart';

/// Paleta de cores do Conecta Lactare.
/// Equivalente ao arquivo ui/theme/Color.kt do projeto Android original.
class AppColors {
  AppColors._();

  static const brand = Color(0xFF0E4F8A);
  static const brandDark = Color(0xFF07335B);
  static const brandLight = Color(0xFFE7F1FA);
  static const accent = Color(0xFFF4F8FC);
  static const success = Color(0xFF16A34A);
  static const successBg = Color(0xFFDCFCE7);
  static const warning = Color(0xFFF59E0B);
  static const warningBg = Color(0xFFFEF3C7);
  static const danger = Color(0xFFDC2626);
  static const dangerBg = Color(0xFFFEE2E2);
  static const slateText = Color(0xFF1E293B);
  static const slateMuted = Color(0xFF64748B);
  static const neutralBg = Color(0xFFF1F5F9);
}

/// Tema Material do app.
/// Equivalente ao arquivo ui/theme/Theme.kt do projeto Android original.
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.brand,
      primary: AppColors.brand,
      onPrimary: Colors.white,
      primaryContainer: AppColors.brandLight,
      onPrimaryContainer: AppColors.brandDark,
      secondary: AppColors.brandDark,
      surface: Colors.white,
      error: AppColors.danger,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.accent,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.brandDark,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 28, height: 1.2),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 22, height: 1.25),
        titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        bodyLarge:
            TextStyle(fontWeight: FontWeight.normal, fontSize: 16, height: 1.35),
        bodyMedium:
            TextStyle(fontWeight: FontWeight.normal, fontSize: 14, height: 1.4),
        labelLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brand,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.brandLight,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontSize: 11,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? AppColors.brand : AppColors.slateMuted,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? AppColors.brand : AppColors.slateMuted,
          );
        }),
      ),
    );
  }
}
