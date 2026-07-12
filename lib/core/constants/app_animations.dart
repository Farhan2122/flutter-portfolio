import 'package:flutter/material.dart';

/// Elegant, slow animation constants — Apple-inspired feel
class AppAnimations {
  // ── Durations ─────────────────────────────────────────────────────────────
  static const Duration ultraFast = Duration(milliseconds: 150);
  static const Duration fast = Duration(milliseconds: 250);
  static const Duration normal = Duration(milliseconds: 400);
  static const Duration slow = Duration(milliseconds: 600);
  static const Duration verySlow = Duration(milliseconds: 900);
  static const Duration entrance = Duration(milliseconds: 700);
  static const Duration stagger = Duration(milliseconds: 120);

  // Legacy aliases
  static const Duration sectionTransitionDuration = slow;
  static const Duration pageTransitionDuration = normal;
  static const Duration buttonPressDuration = ultraFast;
  static const Duration imageFadeDuration = fast;

  // ── Curves ────────────────────────────────────────────────────────────────
  static const Curve defaultCurve = Curves.easeInOut;
  static const Curve entranceCurve = Curves.easeOutCubic;
  static const Curve exitCurve = Curves.easeInCubic;
  static const Curve springCurve = Curves.elasticOut;
  static const Curve smoothCurve = Curves.easeOutQuart;

  // ── Slide offsets ─────────────────────────────────────────────────────────
  static const Offset slideFromBottom = Offset(0, 40);
  static const Offset slideFromLeft = Offset(-30, 0);
  static const Offset slideFromRight = Offset(30, 0);

  // ── Hover ─────────────────────────────────────────────────────────────────
  static const Duration hoverDuration = fast;
  static const double hoverScale = 1.02;
  static const double hoverElevation = 24.0;

  // ── Blob / Background animation ───────────────────────────────────────────
  static const Duration blobDuration = Duration(seconds: 8);
}
