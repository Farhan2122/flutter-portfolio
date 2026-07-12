import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../data/repositories/portfolio_repository.dart';
import '../../widgets/animated_visibility.dart';
import 'widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    final projects = PortfolioRepository().getProjects();

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section header
              AnimatedVisibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PROJECTS',
                      style: AppTextStyles.overline.copyWith(
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Selected Work',
                      style: AppTextStyles.heading2.copyWith(
                        color: isDark
                            ? AppColors.darkText
                            : AppColors.lightText,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Enterprise applications built with Flutter.',
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

              // Project grid
              isDesktop || isTablet
                  ? _ProjectGrid(projects: projects, isDark: isDark)
                  : _ProjectList(projects: projects, isDark: isDark),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  final List projects;
  final bool isDark;
  const _ProjectGrid({required this.projects, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 420,
        crossAxisSpacing: AppDimensions.cardSpacing,
        mainAxisSpacing: AppDimensions.cardSpacing,
        childAspectRatio: 0.78,
      ),
      itemCount: projects.length,
      itemBuilder: (ctx, i) => AnimatedVisibility(
        delay: Duration(milliseconds: i * 120),
        child: ProjectCard(project: projects[i], isDark: isDark),
      ),
    );
  }
}

class _ProjectList extends StatelessWidget {
  final List projects;
  final bool isDark;
  const _ProjectList({required this.projects, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < projects.length; i++) ...[
          AnimatedVisibility(
            delay: Duration(milliseconds: i * 120),
            child: ProjectCard(project: projects[i], isDark: isDark),
          ),
          if (i < projects.length - 1)
            const SizedBox(height: AppDimensions.cardSpacing),
        ],
      ],
    );
  }
}
