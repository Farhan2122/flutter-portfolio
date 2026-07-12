import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive_helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Container(
      width: double.infinity,
      color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: isDesktop
            ? AppDimensions.pagePaddingDesktop
            : AppDimensions.pagePaddingMobile,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppDimensions.maxContentWidth),
          child: Column(
            children: [
              Divider(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
              const SizedBox(height: 28),

              isDesktop
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _FooterLeft(isDark: isDark),
                        _FooterRight(isDark: isDark),
                      ],
                    )
                  : Column(
                      children: [
                        _FooterLeft(isDark: isDark),
                        const SizedBox(height: 16),
                        _FooterRight(isDark: isDark),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLeft extends StatelessWidget {
  final bool isDark;
  const _FooterLeft({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.bodySmall.copyWith(
          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
        ),
        children: [
          const TextSpan(text: 'Designed & Developed by '),
          TextSpan(
            text: 'Muhammad Farhan',
            style: AppTextStyles.bodySmall.copyWith(
              color: isDark ? AppColors.darkText : AppColors.lightText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterRight extends StatelessWidget {
  final bool isDark;
  const _FooterRight({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.bodySmall.copyWith(
          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
        ),
        children: [
          const TextSpan(text: 'Built with '),
          TextSpan(
            text: 'Flutter',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: '  ❤️'),
        ],
      ),
    );
  }
}
