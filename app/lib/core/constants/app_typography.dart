import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Centralized Typography System for Sports App
/// Changing font family or typography scale here updates the entire application.
class AppTypography {
  AppTypography._();

  // ==========================================
  // 1. PRIMARY FONT FAMILY BUILDER
  // ==========================================
  /// Change this function to swap the entire app's font family (e.g. inter, poppins, roboto, barlow)
  static TextStyle font({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,
    );
  }

  /// App-wide TextTheme built dynamically from the central font
  static TextTheme get textTheme {
    return GoogleFonts.interTextTheme().copyWith(
      displayLarge: font(fontSize: 32, fontWeight: FontWeight.w800, color: AppColors.textDark),
      displayMedium: font(fontSize: 28, fontWeight: FontWeight.w800, color: AppColors.textDark),
      displaySmall: font(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textDark),
      headlineMedium: font(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textDark),
      headlineSmall: font(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textDark),
      titleLarge: font(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textDark),
      titleMedium: font(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textDark),
      titleSmall: font(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textDark),
      bodyLarge: font(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textDark),
      bodyMedium: font(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textMedium),
      bodySmall: font(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textLight),
      labelLarge: font(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textDark),
      labelMedium: font(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textMedium),
      labelSmall: font(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textLight),
    );
  }

  // ==========================================
  // 2. SEMANTIC TEXT STYLES (Ready-to-use constants)
  // ==========================================
  static TextStyle h1 = font(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.textDark);
  static TextStyle h2 = font(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static TextStyle h3 = font(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textDark);
  static TextStyle subtitle = font(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textMedium);
  static TextStyle body = font(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textDark);
  static TextStyle caption = font(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textLight);
  static TextStyle button = font(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white);

  // ==========================================
  // 3. WEB SHOWCASE / LANDING TYPOGRAPHY
  // ==========================================
  static TextStyle heroHeadingDesktop = font(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 56 / 48,
    color: AppColors.greyscale90,
    letterSpacing: -0.5,
  );

  static TextStyle heroHeadingMobile = font(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 36 / 28,
    color: AppColors.greyscale90,
    letterSpacing: -0.3,
  );

  static TextStyle heroSubtitleDesktop = font(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 34 / 24,
    color: AppColors.greyscale90,
  );

  static TextStyle heroSubtitleMobile = font(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 22 / 16,
    color: AppColors.greyscale60,
  );

  static TextStyle ratingDesktop = font(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: AppColors.greyscale90,
  );

  static TextStyle ratingMobile = font(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: AppColors.greyscale90,
  );

  static TextStyle sectionTitle = font(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.greyscale90,
  );

  static TextStyle sectionSubtitle = font(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.greyscale60,
  );

  static TextStyle navLink = font(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.greyscale90,
  );

  static TextStyle buttonText = font(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
