/// Web-first spacing and sizing constants
class AppDimensions {
  // ── Page layout ───────────────────────────────────────────────────────────
  static const double maxContentWidth = 1200.0;
  static const double pagePaddingDesktop = 80.0;
  static const double pagePaddingTablet = 40.0;
  static const double pagePaddingMobile = 24.0;

  // Legacy alias
  static const double pagePadding = pagePaddingMobile;

  // ── Section spacing ───────────────────────────────────────────────────────
  static const double sectionPaddingVertical = 120.0;
  static const double sectionPaddingVerticalMobile = 80.0;
  static const double sectionSpacing = 80.0;
  static const double contentSpacing = 24.0;
  static const double itemSpacing = 16.0;

  // ── Card ──────────────────────────────────────────────────────────────────
  static const double cardPadding = 32.0;
  static const double cardPaddingMobile = 24.0;
  static const double cardBorderRadius = 20.0;
  static const double cardSpacing = 24.0;
  static const double cardElevation = 0.0;

  // ── Chips ─────────────────────────────────────────────────────────────────
  static const double chipPaddingHorizontal = 16.0;
  static const double chipPaddingVertical = 8.0;
  static const double chipBorderRadius = 100.0; // pill
  static const double chipSpacing = 10.0;
  static const double chipElevation = 0.0;

  // ── Buttons ───────────────────────────────────────────────────────────────
  static const double buttonBorderRadius = 100.0; // pill
  static const double buttonPaddingH = 28.0;
  static const double buttonPaddingV = 16.0;
  static const double buttonSpacing = 16.0;

  // ── Navigation bar ────────────────────────────────────────────────────────
  static const double navHeight = 72.0;
  static const double navBlurSigma = 20.0;

  // ── Icons ─────────────────────────────────────────────────────────────────
  static const double iconSize = 24.0;
  static const double iconSizeSmall = 18.0;
  static const double iconSizeLarge = 48.0;
  static const double iconSizeMedium = 32.0;

  // ── Breakpoints ───────────────────────────────────────────────────────────
  static const double breakpointMobile = 600.0;
  static const double breakpointTablet = 1024.0;
  static const double breakpointDesktop = 1200.0;

  // ── Touch targets ─────────────────────────────────────────────────────────
  static const double minTouchTarget = 48.0;

  // ── Timeline ─────────────────────────────────────────────────────────────
  static const double timelineDotSize = 14.0;
  static const double timelineLineWidth = 2.0;
  static const double listItemPadding = 16.0;

  // ── Image ─────────────────────────────────────────────────────────────────
  static const double imageBorderRadius = 16.0;
}
