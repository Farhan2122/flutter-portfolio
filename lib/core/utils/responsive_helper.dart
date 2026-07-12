import 'package:flutter/material.dart';
import '../constants/app_dimensions.dart';

/// Utility for responsive design and screen size detection
class ResponsiveHelper {
  // Breakpoint constants
  static const double mobileMaxWidth = 600;
  static const double tabletMaxWidth = 1024;

  /// Check if the current screen is mobile size
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileMaxWidth;
  }

  /// Check if the current screen is tablet size
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileMaxWidth && width < tabletMaxWidth;
  }

  /// Check if the current screen is desktop size
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletMaxWidth;
  }

  /// Get responsive padding based on screen size
  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) return AppDimensions.pagePadding;
    if (isTablet(context)) return AppDimensions.pagePadding * 1.5;
    return AppDimensions.pagePadding * 2;
  }
}
