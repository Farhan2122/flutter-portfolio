import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../widgets/animated_visibility.dart';

class TechStackSection extends StatelessWidget {
  const TechStackSection({super.key});

  static const _stack = [
    (
      icon: FontAwesomeIcons.flutter,
      label: 'Flutter',
      color: Color(0xFF54C5F8),
    ),
    (icon: FontAwesomeIcons.github, label: 'GitHub', color: Color(0xFF6e5494)),
    (
      icon: FontAwesomeIcons.android,
      label: 'Android',
      color: Color(0xFF3DDC84),
    ),
    (icon: FontAwesomeIcons.apple, label: 'iOS', color: Color(0xFF666666)),
    (
      icon: FontAwesomeIcons.google,
      label: 'Firebase',
      color: Color(0xFFFFCA28),
    ),
    (
      icon: FontAwesomeIcons.database,
      label: 'Supabase',
      color: Color(0xFF3ECF8E),
    ),
    (icon: FontAwesomeIcons.code, label: 'VS Code', color: Color(0xFF0078D7)),
    (icon: FontAwesomeIcons.robot, label: 'AI Tools', color: Color(0xFF007AFF)),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveHelper.isDesktop(context);

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
              AnimatedVisibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TECH STACK',
                      style: AppTextStyles.overline.copyWith(
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Tools & Platforms',
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

              AnimatedVisibility(
                delay: const Duration(milliseconds: 150),
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.start,
                  children: [
                    for (int i = 0; i < _stack.length; i++)
                      _TechIcon(
                        icon: _stack[i].icon,
                        label: _stack[i].label,
                        color: _stack[i].color,
                        isDark: isDark,
                        animDelay: Duration(milliseconds: 60 * i),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechIcon extends StatefulWidget {
  final FaIconData icon;
  final String label;
  final Color color;
  final bool isDark;
  final Duration animDelay;

  const _TechIcon({
    required this.icon,
    required this.label,
    required this.color,
    required this.isDark,
    required this.animDelay,
  });

  @override
  State<_TechIcon> createState() => _TechIconState();
}

class _TechIconState extends State<_TechIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child:
          AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutQuart,
                transform: Matrix4.translationValues(
                  0.0,
                  _hovered ? -8.0 : 0.0,
                  0.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: _hovered
                            ? widget.color.withOpacity(0.12)
                            : (widget.isDark
                                  ? AppColors.darkSurfaceElevated
                                  : AppColors.lightBackground),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _hovered
                              ? widget.color.withOpacity(0.5)
                              : (widget.isDark
                                    ? AppColors.darkBorder
                                    : AppColors.lightBorder),
                          width: 1,
                        ),
                        boxShadow: _hovered
                            ? [
                                BoxShadow(
                                  color: widget.color.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 6),
                                ),
                              ]
                            : [],
                      ),
                      child: Center(
                        child: FaIcon(
                          widget.icon,
                          size: 28,
                          color: _hovered
                              ? widget.color
                              : (widget.isDark
                                    ? AppColors.darkTextSecondary
                                    : AppColors.lightTextSecondary),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.label,
                      style: AppTextStyles.caption.copyWith(
                        color: _hovered
                            ? widget.color
                            : (widget.isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.lightTextSecondary),
                        fontWeight: _hovered
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(delay: widget.animDelay, duration: 500.ms)
              .scale(
                begin: const Offset(0.85, 0.85),
                end: const Offset(1, 1),
                delay: widget.animDelay,
                duration: 500.ms,
                curve: Curves.easeOutBack,
              ),
    );
  }
}
