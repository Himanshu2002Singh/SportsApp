import 'package:flutter/material.dart';

/// Centralized Design Tokens - Colors for Sports App
/// Any future client color theme change can be done here in ONE place.
class AppColors {
  AppColors._();

  // ==========================================
  // 1. BRAND & HEADER ACCENTS (Theme primary/secondary)
  // ==========================================
  /// Signature Brand Crimson Red (Logo, live badges, active tabs, header red)
  static const Color brandRed = Color(0xFFE21C28);
  static const Color headerRed = Color(0xFFE5202C);
  static const Color brandRedDark = Color(0xFFB4151F);
  static const Color brandRedLight = Color(0xFFFFECEE);
  static const Color brandRedTransparent = Color(0x33E21C28);

  // ==========================================
  // 2. PRIMARY ACTION & CTA (Buttons, active icons, tabs)
  // ==========================================
  /// Primary Action Green/Teal (Main CTA buttons, selected chips, confirm)
  static const Color primaryTeal = Color(0xFF006D5B);
  static const Color primaryTealDark = Color(0xFF005648);
  static const Color primaryTealLight = Color(0xFFE6F2F0);
  static const Color primaryTealAccent = Color(0xFF00897B);
  static const Color primaryTealBg = Color(0xFFE0F2F1);

  // Semantic Shortcuts for Actions
  static const Color primaryAction = primaryTeal;
  static const Color primaryActionDark = primaryTealDark;
  static const Color primaryActionLight = primaryTealLight;
  static const Color primaryActionAccent = primaryTealAccent;

  // ==========================================
  // 3. NEUTRAL GREYS & SURFACES (Tailwind-style scale)
  // ==========================================
  static const Color grey50 = Color(0xFFF9FAFB);  // Subtlest background / card alt
  static const Color grey100 = Color(0xFFF3F4F6); // Pill button backgrounds / chips
  static const Color grey200 = Color(0xFFE5E7EB); // Borders, dividers, unselected
  static const Color grey300 = Color(0xFFD1D5DB); // Input borders, disabled text
  static const Color grey400 = Color(0xFF9CA3AF); // Placeholder hints, icons
  static const Color grey500 = Color(0xFF6B7280); // Secondary copy, subtitles
  static const Color grey600 = Color(0xFF4B5563); // Notice text, medium emphasis
  static const Color grey700 = Color(0xFF374151); // Darker body text
  static const Color grey800 = Color(0xFF1F2937); // Section headers, deep neutral
  static const Color grey900 = Color(0xFF111827); // Headlines, primary text
  static const Color slateBg = Color(0xFFF1F5F9); // Light slate chip background
  static const Color charcoalDark = Color(0xFF263238); // Dark charcoal headers/drawers
  static const Color charcoalHeader = Color(0xFF2C2C2C);

  // ==========================================
  // 4. BACKGROUNDS & SURFACES
  // ==========================================
  static const Color scaffoldBackground = Color(0xFFFFFFFF);
  static const Color surfaceLight = grey50;
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color drawerHeaderDark = Color(0xFF25292E);
  static const Color cardBorder = grey200;
  static const Color divider = grey200;
  static const Color inputBorder = grey300;
  static const Color inputBorderFocused = primaryTeal;

  // ==========================================
  // 5. TEXT & TYPOGRAPHY COLORS
  // ==========================================
  static const Color textDark = grey900;
  static const Color textMedium = grey600;
  static const Color textLight = grey400;
  static const Color textMuted = grey500;

  // ==========================================
  // 6. ACCENTS, STATUS & SPORTS BADGES
  // ==========================================
  static const Color liveRed = Color(0xFFE21C28);
  static const Color proBadge = primaryTealAccent;
  static const Color proGold = Color(0xFFFFB800);
  static const Color goldRating = Color(0xFFFFB800);
  static const Color cyanProgress = Color(0xFF38BDF8);
  static const Color ballTennisGreen = Color(0xFF009688);
  static const Color ballLeatherRed = Color(0xFFD32F2F);
  static const Color ballOtherOrange = Color(0xFFFF6D00);
  static const Color grassGreen = Color(0xFF00B050);
  static const Color secondary = Color(0xFF18958F);
  static const Color khakhi50 = Color(0xFFCB8E40);
  static const Color tealAvatarBg = Color(0xFFD3EBE7);
  static const Color jerseyYellow = Color(0xFFFACC15);
  static const Color jerseyBlue = Color(0xFF1E40AF);
  static const Color jerseyDarkBlue = Color(0xFF1E3A8A);
  static const Color jerseyRoyalBlue = Color(0xFF1D4ED8);
  static const Color navyDark = Color(0xFF1E2830);
  static const Color navyMedium = Color(0xFF25333D);
  static const Color amberBanner = Color(0xFFF59E0B);
  static const Color amberBannerDark = Color(0xFFD97706);
  static const Color purpleAvatar = Color(0xFF6B21A8);
  static const Color followCyan = Color(0xFF00E5FF);

  // ==========================================
  // 7. WEB SHOWCASE BACKWARD COMPATIBILITY
  // ==========================================
  static const Color primary = brandRed;
  static const Color primaryDark = brandRedDark;
  static const Color primaryLight = Color(0xFFF26472);
  static const Color primaryTransparent = brandRedTransparent;
  static const Color background = scaffoldBackground;
  static const Color greyscale95 = Color(0xFF0B0B0B);
  static const Color greyscale90 = Color(0xFF191919);
  static const Color greyscale60 = Color(0xFF666667);
  static const Color greyscale45 = Color(0xFF8E8E93);
  static const Color greyscale35 = Color(0xFF989898);
  static const Color greyscale30 = Color(0xFFB2B3B3);
  static const Color greyscale20 = Color(0xFFCCCBCB);
  static const Color greyscale10 = Color(0xFFE6E6E5);
}
