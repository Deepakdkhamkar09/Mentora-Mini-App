import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.accent,
          surface: AppColors.surface,
          error: AppColors.error,
          onPrimary: AppColors.white,
          onSurface: AppColors.textPrimary,
        ),
        
        // Refined Card Theme
        cardTheme: CardThemeData(
          color: AppColors.surface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.border, width: 1),
          ),
          margin: EdgeInsets.zero,
        ),
        
        // Refined Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            elevation: 0,
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
          ),
        ),
        
        // Clean Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.error),
          ),
          labelStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
          floatingLabelStyle: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
        ),
        
        // Professional Typography Hierarchy
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary, letterSpacing: -1.0),
          displayMedium: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary, letterSpacing: -0.5),
          displaySmall: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          headlineMedium: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textPrimary, fontSize: 24, letterSpacing: -0.5),
          headlineSmall: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary, fontSize: 20),
          titleLarge: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary, fontSize: 18),
          titleMedium: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary, fontSize: 16),
          bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 16, height: 1.5),
          bodyMedium: TextStyle(color: AppColors.textPrimary, fontSize: 14, height: 1.5),
          bodySmall: TextStyle(color: AppColors.textSecondary, fontSize: 12),
        ),
        
        // Minimal AppBar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          iconTheme: IconThemeData(color: AppColors.textPrimary, size: 22),
        ),
      );
}
