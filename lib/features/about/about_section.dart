import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../data/repositories/portfolio_repository.dart';
import '../../widgets/animated_visibility.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final about = PortfolioRepository().getAboutInfo();

    return Container(
      width: double.infinity,
      color: isDark ? AppColors.darkSurface : AppColors.lightSurfaceElevated,
      padding: EdgeInsets.symmetric(
        vertical: isDesktop
            ? AppDimensions.sectionPaddingVertical
            : AppDimensions.sectionPaddingVerticalMobile,
        horizontal: isDesktop
            ? AppDimensions.pagePaddingDesktop
            : AppDimensions.pagePaddingMobile,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppDimensions.maxContentWidth,
          ),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 4, child: _PhotoColumn(isDark: isDark)),
                    const SizedBox(width: 80),
                    Expanded(
                      flex: 6,
                      child: _TextColumn(about: about, isDark: isDark),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _PhotoColumn(isDark: isDark),
                    const SizedBox(height: 48),
                    _TextColumn(about: about, isDark: isDark),
                  ],
                ),
        ),
      ),
    );
  }
}

class _PhotoColumn extends StatelessWidget {
  final bool isDark;
  const _PhotoColumn({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return AnimatedVisibility(
      beginOffset: const Offset(-40, 0),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Glow ring
            Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withOpacity(0.2),
                    AppColors.accent.withOpacity(0),
                  ],
                ),
              ),
            ),
            // Photo
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.4 : 0.1),
                    blurRadius: 40,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: isDark
                        ? AppColors.darkSurfaceElevated
                        : AppColors.lightSurfaceElevated,
                    child: Icon(
                      Icons.person_rounded,
                      size: 80,
                      color: isDark
                          ? AppColors.darkTextTertiary
                          : AppColors.lightTextTertiary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextColumn extends StatelessWidget {
  final dynamic about;
  final bool isDark;
  const _TextColumn({required this.about, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return AnimatedVisibility(
      beginOffset: const Offset(40, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section label
          Text(
            'ABOUT ME',
            style: AppTextStyles.overline.copyWith(color: AppColors.accent),
          ),
          const SizedBox(height: 12),
          Text(
            'Flutter Developer\nat CODELOUNGE',
            style: AppTextStyles.heading2.copyWith(
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            about.bio,
            style: AppTextStyles.body.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            about.summary,
            style: AppTextStyles.body.copyWith(
              color: isDark
                  ? AppColors.darkTextTertiary
                  : AppColors.lightTextTertiary,
            ),
          ),
          const SizedBox(height: 36),

          // Quick highlights
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _HighlightChip(label: '1+ Years Experience'),
              _HighlightChip(label: 'Lahore, Pakistan'),
              _HighlightChip(label: 'Enterprise Mobile Apps'),
              _HighlightChip(label: 'BLE · NFC · Face Recognition'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HighlightChip extends StatelessWidget {
  final String label;
  const _HighlightChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.chipPaddingHorizontal,
        vertical: AppDimensions.chipPaddingVertical,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceElevated
            : AppColors.lightBackground,
        borderRadius: BorderRadius.circular(AppDimensions.chipBorderRadius),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTextStyles.chip.copyWith(
          color: isDark
              ? AppColors.darkTextSecondary
              : AppColors.lightTextSecondary,
        ),
      ),
    );
  }
}
