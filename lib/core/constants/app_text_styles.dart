import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Apple-inspired typography using Inter
class AppTextStyles {
  // ── Hero / Display ────────────────────────────────────────────────────────
  static TextStyle get display => GoogleFonts.inter(
    fontSize: 72,
    fontWeight: FontWeight.w800,
    height: 1.05,
    letterSpacing: -2.5,
  );

  static TextStyle get displayMedium => GoogleFonts.inter(
    fontSize: 56,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: -2.0,
  );

  // ── Headings ──────────────────────────────────────────────────────────────
  static TextStyle get heading1 => GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -1.5,
  );

  static TextStyle get heading2 => GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -1.0,
  );

  static TextStyle get heading3 => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.5,
  );

  static TextStyle get heading4 => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.35,
    letterSpacing: -0.3,
  );

  // ── Body ──────────────────────────────────────────────────────────────────
  static TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: -0.2,
  );

  static TextStyle get body => GoogleFonts.inter(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.65,
    letterSpacing: -0.1,
  );

  static TextStyle get bodySmall =>
      GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w400, height: 1.6);

  // ── Label / Caption ───────────────────────────────────────────────────────
  static TextStyle get label => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.6,
  );

  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.3,
  );

  static TextStyle get overline => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 1.2,
  );

  // ── UI Elements ───────────────────────────────────────────────────────────
  static TextStyle get button => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
  );

  static TextStyle get navItem => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.1,
  );

  static TextStyle get chip => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  // ── Stats ─────────────────────────────────────────────────────────────────
  static TextStyle get statNumber => GoogleFonts.inter(
    fontSize: 52,
    fontWeight: FontWeight.w800,
    height: 1.0,
    letterSpacing: -2.0,
  );

  static TextStyle get statLabel => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.2,
  );

  // ── Sub-heading (section label) ───────────────────────────────────────────
  static TextStyle get subtitle => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: -0.2,
  );
}
