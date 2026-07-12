import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../data/repositories/portfolio_repository.dart';
import '../../data/models/skill.dart';
import '../../widgets/animated_visibility.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final skills = PortfolioRepository().getSkills();

    final categories = <String, List<Skill>>{};
    for (final s in skills) {
      categories.putIfAbsent(s.category, () => []).add(s);
    }

    // Ordered display
    final orderedKeys = [
      'Framework',
      'Language',
      'State Management',
      'Backend',
      'Architecture',
      'Hardware',
      'Storage',
      'Version Control',
      'Platform',
      'Soft Skill',
      'AI Tools',
    ].where(categories.containsKey).toList();

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
              AnimatedVisibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SKILLS',
                      style: AppTextStyles.overline.copyWith(
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'What I Work With',
                      style: AppTextStyles.heading2.copyWith(
                        color: isDark
                            ? AppColors.darkText
                            : AppColors.lightText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Technologies, tools, and competencies.',
                      style: AppTextStyles.body.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 56),

              // Category groups
              for (int ci = 0; ci < orderedKeys.length; ci++) ...[
                AnimatedVisibility(
                  delay: Duration(milliseconds: ci * 80),
                  child: _SkillCategory(
                    category: orderedKeys[ci],
                    skills: categories[orderedKeys[ci]]!,
                    isDark: isDark,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String category;
  final List<Skill> skills;
  final bool isDark;

  const _SkillCategory({
    required this.category,
    required this.skills,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.toUpperCase(),
          style: AppTextStyles.label.copyWith(
            color: isDark
                ? AppColors.darkTextTertiary
                : AppColors.lightTextTertiary,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills
              .map((s) => _SkillCard(skill: s, isDark: isDark))
              .toList(),
        ),
      ],
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Skill skill;
  final bool isDark;
  const _SkillCard({required this.skill, required this.isDark});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.chipPaddingHorizontal,
          vertical: AppDimensions.chipPaddingVertical,
        ),
        transform: Matrix4.translationValues(0.0, _hovered ? -3.0 : 0.0, 0.0),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.accent.withOpacity(0.08)
              : (widget.isDark
                    ? AppColors.darkSurfaceElevated
                    : AppColors.lightSurfaceElevated),
          borderRadius: BorderRadius.circular(AppDimensions.chipBorderRadius),
          border: Border.all(
            color: _hovered
                ? AppColors.accent.withOpacity(0.4)
                : (widget.isDark
                      ? AppColors.darkBorder
                      : AppColors.lightBorder),
            width: 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withOpacity(0.12),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Text(
          widget.skill.name,
          style: AppTextStyles.chip.copyWith(
            color: _hovered
                ? AppColors.accent
                : (widget.isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary),
            fontWeight: _hovered ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
