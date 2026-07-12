import 'package:flutter/material.dart';

/// Apple-inspired color palette for the portfolio app
class AppColors {
  // ── Brand accent ──────────────────────────────────────────────────────────
  static const Color accent = Color(0xFF007AFF); // iOS blue
  static const Color accentHover = Color(0xFF0066CC);
  static const Color accentLight = Color(0xFFE8F0FE);

  // ── Light theme ───────────────────────────────────────────────────────────
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceElevated = Color(0xFFF5F5F7); // Apple gray
  static const Color lightBorder = Color(0xFFE5E5EA);
  static const Color lightText = Color(0xFF111111);
  static const Color lightTextSecondary = Color(0xFF666666);
  static const Color lightTextTertiary = Color(0xFF999999);

  // Aliases used by theme
  static const Color lightPrimary = accent;
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightPrimaryContainer = accentLight;
  static const Color lightSecondary = Color(0xFF34C759); // iOS green
  static const Color lightOnSurface = lightText;
  static const Color lightCardBackground = Color(0xFFFFFFFF);

  // ── Dark theme ────────────────────────────────────────────────────────────
  static const Color darkBackground = Color(0xFF0B0B0B);
  static const Color darkSurface = Color(0xFF141414);
  static const Color darkSurfaceElevated = Color(0xFF1C1C1E); // Apple dark gray
  static const Color darkBorder = Color(0xFF2C2C2E);
  static const Color darkText = Color(0xFFF5F5F7);
  static const Color darkTextSecondary = Color(0xFF98989D);
  static const Color darkTextTertiary = Color(0xFF636366);

  // Aliases used by theme
  static const Color darkPrimary = Color(0xFF0A84FF); // iOS blue dark
  static const Color darkOnPrimary = Color(0xFFFFFFFF);
  static const Color darkPrimaryContainer = Color(0xFF1A2F4A);
  static const Color darkSecondary = Color(0xFF30D158);
  static const Color darkOnSurface = darkText;
  static const Color darkCardBackground = darkSurfaceElevated;

  // ── Gradients ─────────────────────────────────────────────────────────────
  // Subtle accent gradient (used only where absolutely needed)
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF007AFF), Color(0xFF0055D4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Frosted glass card gradient — light
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF5F5F7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Frosted glass card gradient — dark
  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF1C1C1E), Color(0xFF2C2C2E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Hero animated background blobs
  static const Color blobBlue = Color(0x33007AFF);
  static const Color blobPurple = Color(0x220A84FF);
  static const Color blobCyan = Color(0x1132ADE8);

  // Gradient overlays kept for backward-compat references
  static const Color primaryGradientStart = Color(0xFF007AFF);
  static const Color primaryGradientEnd = Color(0xFF0055D4);
  static const Color secondaryGradientStart = Color(0xFF34C759);
  static const Color secondaryGradientEnd = Color(0xFF30D158);

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondaryGradientStart, secondaryGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Accent colors (used for tech chips)
  static const Color accentBlue = Color(0xFF007AFF);
  static const Color accentPurple = Color(0xFF5856D6);
  static const Color accentPink = Color(0xFFFF2D55);
  static const Color accentOrange = Color(0xFFFF9500);
  static const Color accentTeal = Color(0xFF32ADE6);
  static const Color accentGreen = Color(0xFF34C759);
}
