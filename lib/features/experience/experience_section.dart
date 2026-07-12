import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../widgets/animated_visibility.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveHelper.isDesktop(context);

    return Container(
      width: double.infinity,
      color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section label
              AnimatedVisibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EXPERIENCE',
                      style: AppTextStyles.overline.copyWith(
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Work History',
                      style: AppTextStyles.heading2.copyWith(
                        color: isDark
                            ? AppColors.darkText
                            : AppColors.lightText,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 56),

              // Timeline entries — no IntrinsicHeight, no Expanded in scroll context
              _TimelineEntry(
                isDark: isDark,
                isLast: false,
                delay: const Duration(milliseconds: 100),
                role: 'Flutter Developer',
                company: 'CODELOUNGE',
                period: '2025 — Present',
                location: 'Lahore, Pakistan',
                description:
                    'Building enterprise mobile applications for clients across energy, '
                    'workforce management, and service industries. Leading end-to-end '
                    'Flutter development including architecture, API integration, BLE/NFC, '
                    'and App Store / Play Store deployment.',
                tags: const [
                  'Flutter',
                  'Enterprise',
                  'BLE',
                  'NFC',
                  'Supabase',
                  'Firebase',
                ],
                isActive: true,
              ),
              _TimelineEntry(
                isDark: isDark,
                isLast: true,
                delay: const Duration(milliseconds: 220),
                role: 'Flutter Developer (Projects)',
                company: 'Self-directed',
                period: '2024 — 2025',
                location: 'Lahore, Pakistan',
                description:
                    'Developed and shipped multiple Flutter applications independently: '
                    'a Quran learning app with deep linking, a barber-booking platform, '
                    'and contributed to enterprise features across cross-functional teams.',
                tags: const ['Flutter', 'Firebase', 'GetX', 'Deep Linking'],
                isActive: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Timeline entry row (dot + line + card) ───────────────────────────────────
// No IntrinsicHeight, no Expanded in unbounded axis — safe inside Column/Scroll.
class _TimelineEntry extends StatelessWidget {
  final bool isDark;
  final bool isLast;
  final bool isActive;
  final Duration delay;
  final String role;
  final String company;
  final String period;
  final String location;
  final String description;
  final List<String> tags;

  const _TimelineEntry({
    required this.isDark,
    required this.isLast,
    required this.isActive,
    required this.delay,
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.description,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    const dotSize = 14.0;
    const lineWidth = 2.0;
    const railWidth = 30.0;

    return AnimatedVisibility(
      delay: delay,
      child: Padding(
        padding: EdgeInsets.only(bottom: isLast ? 0 : 40),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rail: dot + vertical line segment
            SizedBox(
              width: railWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 26),
                  // Dot
                  Container(
                    width: dotSize,
                    height: dotSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive
                          ? AppColors.accent
                          : (isDark
                                ? AppColors.darkBorder
                                : AppColors.lightBorder),
                      border: isActive
                          ? null
                          : Border.all(
                              color: isDark
                                  ? AppColors.darkBorder
                                  : AppColors.lightBorder,
                            ),
                    ),
                  ),
                  // Line below dot
                  if (!isLast)
                    Container(
                      width: lineWidth,
                      height: 260, // generous fixed height between cards
                      color: isDark
                          ? AppColors.darkBorder
                          : AppColors.lightBorder,
                    ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            // Card
            Expanded(
              child: _ExperienceCard(
                isDark: isDark,
                role: role,
                company: company,
                period: period,
                location: location,
                description: description,
                tags: tags,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Card ─────────────────────────────────────────────────────────────────────
class _ExperienceCard extends StatelessWidget {
  final bool isDark;
  final String role;
  final String company;
  final String period;
  final String location;
  final String description;
  final List<String> tags;

  const _ExperienceCard({
    required this.isDark,
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.description,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.cardPadding),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceElevated
            : AppColors.lightBackground,
        borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role,
                      style: AppTextStyles.heading4.copyWith(
                        color: isDark
                            ? AppColors.darkText
                            : AppColors.lightText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      company,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    period,
                    style: AppTextStyles.caption.copyWith(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: isDark
                            ? AppColors.darkTextTertiary
                            : AppColors.lightTextTertiary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: AppTextStyles.caption.copyWith(
                          color: isDark
                              ? AppColors.darkTextTertiary
                              : AppColors.lightTextTertiary,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          Text(
            description,
            style: AppTextStyles.bodySmall.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags.map((t) => _TechTag(label: t)).toList(),
          ),
        ],
      ),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;
  const _TechTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.accent.withAlpha(20),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.accent.withAlpha(51)),
      ),
      child: Text(
        label,
        style: AppTextStyles.chip.copyWith(color: AppColors.accent),
      ),
    );
  }
}
