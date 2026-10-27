import 'package:flutter/material.dart';

/// Centralized Design Tokens - Colors for Sports App
/// Any future client color theme change can be done here in ONE place.
class AppColors {
  AppColors._();

  // ==========================================
  // 1. BRAND & HEADER ACCENTS (Teal & Grey Theme)
  // ==========================================
  /// Signature Brand Teal (Logo, badges, active tabs, header)
  static const Color brandTeal = Color(0xFF0D9488);        // Tailwind Teal 600
  static const Color headerTeal = Color(0xFF0F766E);       // Tailwind Teal 700 (Commanding Header)
  static const Color brandTealDark = Color(0xFF115E59);   // Tailwind Teal 800
  static const Color brandTealLight = Color(0xFFCCFBF1);  // Tailwind Teal 100
  static const Color brandTealTransparent = Color(0x330D9488);

  // Mapped brand aliases so entire app switches directly to Teal & Grey
  static const Color brandRed = brandTeal;
  static const Color headerRed = headerTeal;
  static const Color brandRedDark = brandTealDark;
  static const Color brandRedLight = brandTealLight;
  static const Color brandRedTransparent = brandTealTransparent;

  // ==========================================
  // 2. PRIMARY ACTION & CTA (Buttons, active icons, tabs)
  // ==========================================
  static const Color primaryTeal = Color(0xFF0D9488);
  static const Color primaryTealDark = Color(0xFF0F766E);
  static const Color primaryTealLight = Color(0xFFCCFBF1);
  static const Color primaryTealAccent = Color(0xFF14B8A6); // Tailwind Teal 500
  static const Color primaryTealBg = Color(0xFFF0FDFA);    // Tailwind Teal 50

  // Semantic Shortcuts for Actions
  static const Color primaryAction = primaryTeal;
  static const Color primaryActionDark = primaryTealDark;
  static const Color primaryActionLight = primaryTealLight;
  static const Color primaryActionAccent = primaryTealAccent;

  // ==========================================
  // 3. NEUTRAL GREYS & SLATE SURFACES (Slate / Cool Grey Scale)
  // ==========================================
  static const Color grey50 = Color(0xFFF8FAFC);  // Crisp slate surface / card alt
  static const Color grey100 = Color(0xFFF1F5F9); // Pill buttons / chip backgrounds
  static const Color grey200 = Color(0xFFE2E8F0); // Elegant dividers & borders
  static const Color grey300 = Color(0xFFCBD5E1); // Input borders, disabled states
  static const Color grey400 = Color(0xFF94A3B8); // Placeholder hints, subtle icons
  static const Color grey500 = Color(0xFF64748B); // Secondary copy, timestamps
  static const Color grey600 = Color(0xFF475569); // Notice copy, medium emphasis
  static const Color grey700 = Color(0xFF334155); // Dark slate body text / badges
  static const Color grey800 = Color(0xFF1E293B); // Deep slate cards / headers
  static const Color grey900 = Color(0xFF0F172A); // Headlines, primary dark text
  static const Color slateBg = Color(0xFFF1F5F9); // Light slate chip background
  static const Color charcoalDark = Color(0xFF1E293B); // Dark charcoal / slate headers
  static const Color charcoalHeader = Color(0xFF0F172A);

  // ==========================================
  // 4. BACKGROUNDS & SURFACES
  // ==========================================
  static const Color scaffoldBackground = Color(0xFFFFFFFF);
  static const Color surfaceLight = grey50;
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color drawerHeaderDark = Color(0xFF0F766E); // Themed teal header
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
  static const Color liveRed = primaryTealAccent;
  static const Color proBadge = primaryTealAccent;
  static const Color proGold = Color(0xFFFFB800);
  static const Color goldRating = Color(0xFFFFB800);
  static const Color cyanProgress = primaryTealAccent;
  static const Color ballTennisGreen = Color(0xFF0D9488);
  static const Color ballLeatherRed = Color(0xFF0F766E);
  static const Color ballOtherOrange = Color(0xFF64748B);
  static const Color grassGreen = Color(0xFF0D9488);
  static const Color secondary = Color(0xFF14B8A6);
  static const Color khakhi50 = Color(0xFFCB8E40);
  static const Color tealAvatarBg = Color(0xFFCCFBF1);
  static const Color jerseyYellow = Color(0xFFFACC15);
  static const Color jerseyBlue = Color(0xFF0D9488);
  static const Color jerseyDarkBlue = Color(0xFF0F766E);
  static const Color jerseyRoyalBlue = Color(0xFF115E59);
  static const Color navyDark = Color(0xFF0F172A);
  static const Color navyMedium = Color(0xFF1E293B);
  static const Color amberBanner = Color(0xFF0D9488);
  static const Color amberBannerDark = Color(0xFF0F766E);
  static const Color purpleAvatar = Color(0xFF475569);
  static const Color followCyan = primaryTealAccent;

  // ==========================================
  // 7. BACKWARD COMPATIBILITY
  // ==========================================
  static const Color primary = brandTeal;
  static const Color primaryDark = brandTealDark;
  static const Color primaryLight = brandTealLight;
  static const Color primaryTransparent = brandTealTransparent;
  static const Color background = scaffoldBackground;
  static const Color greyscale95 = Color(0xFF0F172A);
  static const Color greyscale90 = Color(0xFF1E293B);
  static const Color greyscale60 = Color(0xFF64748B);
  static const Color greyscale45 = Color(0xFF94A3B8);
  static const Color greyscale35 = Color(0xFFCBD5E1);
  static const Color greyscale30 = Color(0xFFCBD5E1);
  static const Color greyscale20 = Color(0xFFE2E8F0);
  static const Color greyscale10 = Color(0xFFF1F5F9);
}
