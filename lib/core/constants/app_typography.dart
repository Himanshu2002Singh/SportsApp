import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// CricHeroes Typography styles using Google Fonts (Roboto / Barlow)
class AppTypography {
  AppTypography._();

  // Desktop Hero Heading: 48px, line-height: 56px, bold, greyscale-90
  static TextStyle heroHeadingDesktop = GoogleFonts.barlow(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 56 / 48,
    color: AppColors.greyscale90,
    letterSpacing: -0.5,
  );

  // Mobile Hero Heading: 28px, line-height: 36px, bold
  static TextStyle heroHeadingMobile = GoogleFonts.barlow(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 36 / 28,
    color: AppColors.greyscale90,
    letterSpacing: -0.3,
  );

  // Desktop Subtitle: 28px, line-height: 34px, greyscale-90
  static TextStyle heroSubtitleDesktop = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 34 / 24,
    color: AppColors.greyscale90,
  );

  // Mobile Subtitle: 16px, line-height: 22px
  static TextStyle heroSubtitleMobile = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 22 / 16,
    color: AppColors.greyscale60,
  );

  // Rating Span Desktop: 26px, font-style: italic, greyscale-90
  static TextStyle ratingDesktop = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: AppColors.greyscale90,
  );

  // Rating Span Mobile: 16px, font-style: italic
  static TextStyle ratingMobile = GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: AppColors.greyscale90,
  );

  // Section Headers
  static TextStyle sectionTitle = GoogleFonts.barlow(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.greyscale90,
  );

  static TextStyle sectionSubtitle = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.greyscale60,
  );

  // Navigation Links
  static TextStyle navLink = GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.greyscale90,
  );

  // Buttons
  static TextStyle buttonText = GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
