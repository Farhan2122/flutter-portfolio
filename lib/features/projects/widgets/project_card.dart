import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/url_launcher_helper.dart';
import '../../../data/models/project.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final bool isDark;

  const ProjectCard({super.key, required this.project, required this.isDark});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutQuart,
        transform: Matrix4.translationValues(0.0, _hovered ? -6.0 : 0.0, 0.0),
        decoration: BoxDecoration(
          color: widget.isDark
              ? AppColors.darkSurfaceElevated
              : AppColors.lightBackground,
          borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
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
                    color: AppColors.accent.withOpacity(
                      widget.isDark ? 0.2 : 0.12,
                    ),
                    blurRadius: 40,
                    offset: const Offset(0, 16),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(widget.isDark ? 0.3 : 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.cardBorderRadius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image / placeholder header
              _CardImageHeader(
                project: widget.project,
                isDark: widget.isDark,
                hovered: _hovered,
              ),

              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(
                    AppDimensions.cardPaddingMobile,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.name,
                        style: AppTextStyles.heading4.copyWith(
                          color: widget.isDark
                              ? AppColors.darkText
                              : AppColors.lightText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          widget.project.description,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: widget.isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tech chips
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: widget.project.technologies
                            .take(4)
                            .map(
                              (t) => _TechChip(label: t, isDark: widget.isDark),
                            )
                            .toList(),
                      ),

                      const SizedBox(height: 20),

                      // Store links
                      _StoreLinks(
                        project: widget.project,
                        isDark: widget.isDark,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardImageHeader extends StatelessWidget {
  final Project project;
  final bool isDark;
  final bool hovered;
  const _CardImageHeader({
    required this.project,
    required this.isDark,
    required this.hovered,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 160,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkBackground
            : AppColors.lightSurfaceElevated,
        gradient: LinearGradient(
          colors: hovered
              ? [
                  AppColors.accent.withOpacity(0.15),
                  AppColors.accent.withOpacity(0.05),
                ]
              : [
                  (isDark
                      ? AppColors.darkSurface
                      : AppColors.lightSurfaceElevated),
                  (isDark
                      ? AppColors.darkSurfaceElevated
                      : AppColors.lightBackground),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: project.imageUrls.isNotEmpty
          ? ClipRRect(
              child: Image.network(
                project.imageUrls.first,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (_, __, ___) =>
                    _Placeholder(project: project, isDark: isDark),
              ),
            )
          : _Placeholder(project: project, isDark: isDark),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final Project project;
  final bool isDark;
  const _Placeholder({required this.project, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.phone_android_rounded,
              color: AppColors.accent,
              size: 28,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            project.name,
            style: AppTextStyles.caption.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;
  final bool isDark;
  const _TechChip({required this.label, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.07),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.accent.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: AppTextStyles.overline.copyWith(
          color: AppColors.accent,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class _StoreLinks extends StatelessWidget {
  final Project project;
  final bool isDark;
  const _StoreLinks({required this.project, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (project.playStoreUrl != null)
          _LinkButton(
            label: 'Play Store',
            icon: Icons.shop_rounded,
            url: project.playStoreUrl!,
            isDark: isDark,
          ),
        if (project.playStoreUrl != null && project.appStoreUrl != null)
          const SizedBox(width: 10),
        if (project.appStoreUrl != null)
          _LinkButton(
            label: 'App Store',
            icon: Icons.apple_rounded,
            url: project.appStoreUrl!,
            isDark: isDark,
          ),
      ],
    );
  }
}

class _LinkButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final String url;
  final bool isDark;
  const _LinkButton({
    required this.label,
    required this.icon,
    required this.url,
    required this.isDark,
  });

  @override
  State<_LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<_LinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => UrlLauncherHelper.launchExternalUrl(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: _hovered
                  ? AppColors.accent
                  : (widget.isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 14,
                color: _hovered
                    ? Colors.white
                    : (widget.isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary),
              ),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: AppTextStyles.chip.copyWith(
                  color: _hovered
                      ? Colors.white
                      : (widget.isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
