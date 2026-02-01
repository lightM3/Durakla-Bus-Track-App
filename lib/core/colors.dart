import 'package:flutter/material.dart';

class AppColors {
  // === BACKGROUND COLORS ===
  static const Color background = Color(0xFF101622);
  static const Color surfaceBackground = Color(0xFF0A0F1A);
  static const Color cardBackground = Color(0xFF1E293B);
  static const Color cardBackgroundAlt = Color(0xFF161F30);
  static const Color cardBackgroundDark = Color(0xFF1B253B);

  // Splash screen gradient
  static const Color gradientStart = Color(0xFF001019);
  static const Color gradientEnd = Color(0xFF000000);

  // === PRIMARY COLORS ===
  static const Color primaryBlue = Color(0xFF256AF4);
  static const Color primaryBlueDark = Color(0xFF1C52BA);
  static const Color primaryBlueLight = Color(0xFF4A80F0);

  // === ACCENT COLORS ===
  static const Color orange = Color(0xFFF97316);
  static const Color liveGreen = Color(0xFF22C55E);
  static const Color successGreen = Color(0xFF24B04B);
  static const Color warningYellow = Color(0xFFFBBF24);
  static const Color errorRed = Color(0xFFEF4444);
  static const Color purple = Color(0xFF9333EA);

  // === STATUS BADGE COLORS ===
  // Now badge
  static const Color nowBackground = Color(0xFF172337);
  static const Color nowBorder = Color(0xFF193160);

  // Delayed badge
  static const Color delayedBackground = Color(0xFF2C281F);
  static const Color delayedBorder = Color(0xFF2C281F);

  // === TEXT COLORS ===
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textTertiary = Color(0xFF64748B);
  static const Color textDisabled = Color(0xFF475569);

  // === BORDER COLORS ===
  static const Color borderPrimary = Color(0xFF334155);
  static const Color borderSecondary = Color(0xFF475569);
  static const Color divider = Color(0xFF334155);

  // === ICON COLORS ===
  static const Color iconPrimary = Color(0xFFFFFFFF);
  static const Color iconSecondary = Color(0xFF94A3B8);
  static const Color iconDisabled = Color(0xFF64748B);

  // === BUTTON COLORS ===
  static const Color buttonPrimary = primaryBlue;
  static const Color buttonSecondary = cardBackground;
  static const Color buttonDisabled = Color(0xFF475569);

  // === OVERLAY COLORS ===
  static const Color overlay = Color(0xCC000000); // 80% black
  static const Color overlayLight = Color(0x33000000); // 20% black
  static const Color overlayDark = Color(0xE6000000); // 90% black

  // === SPECIAL SURFACES ===
  static const Color surfaceDark = Color(0xFF0F172A);

  // === OPACITY VARIANTS ===
  // Blue with opacity
  static const Color blueOpacity40 = Color(0x66256AF4); // 40%
  static const Color blueOpacity20 = Color(0x33256AF4); // 20%
  static const Color blueOpacity10 = Color(0x1A256AF4); // 10%

  // White with opacity
  static const Color whiteOpacity70 = Color(0xB3FFFFFF); // 70%
  static const Color whiteOpacity20 = Color(0x33FFFFFF); // 20%
  static const Color whiteOpacity10 = Color(0x1AFFFFFF); // 10%

  // Orange with opacity
  static const Color orangeOpacity20 = Color(0x33F97316); // 20%

  // === ROUTE COLORS (for different bus lines) ===
  static const List<Color> routeColors = [
    primaryBlue, // Blue #256AF4
    orange, // Orange #F97316
    liveGreen, // Green #22C55E
    purple, // Purple
    Color(0xFFEC4899), // Pink
    Color(0xFF8B5CF6), // Violet
    Color(0xFF06B6D4), // Cyan
    Color(0xFFF59E0B), // Amber
  ];

  // === HELPER METHODS ===

  // Get route color by index
  static Color getRouteColor(int index) {
    return routeColors[index % routeColors.length];
  }

  // Private constructor to prevent instantiation
  AppColors._();
}
