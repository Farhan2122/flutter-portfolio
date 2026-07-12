import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../app.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_text_styles.dart';

enum NavSection { about, experience, projects, skills, contact }

class PortfolioNavBar extends StatefulWidget {
  final ScrollController scrollController;
  final void Function(NavSection) onNavTap;

  const PortfolioNavBar({
    super.key,
    required this.scrollController,
    required this.onNavTap,
  });

  @override
  State<PortfolioNavBar> createState() => _PortfolioNavBarState();
}

class _PortfolioNavBarState extends State<PortfolioNavBar> {
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 20;
    if (scrolled != _scrolled) setState(() => _scrolled = scrolled);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = MediaQuery.of(context).size.width < AppDimensions.breakpointMobile;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: AppDimensions.navBlurSigma,
          sigmaY: AppDimensions.navBlurSigma,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: AppDimensions.navHeight,
          decoration: BoxDecoration(
            color: isDark
                ? (AppColors.darkBackground).withOpacity(_scrolled ? 0.85 : 0.6)
                : (AppColors.lightBackground).withOpacity(_scrolled ? 0.88 : 0.7),
            border: Border(
              bottom: BorderSide(
                color: isDark
                    ? AppColors.darkBorder.withOpacity(_scrolled ? 1 : 0)
                    : AppColors.lightBorder.withOpacity(_scrolled ? 1 : 0),
                width: 1,
              ),
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppDimensions.maxContentWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile
                      ? AppDimensions.pagePaddingMobile
                      : AppDimensions.pagePaddingDesktop,
                ),
                child: Row(
                  children: [
                    // Logo / name
                    GestureDetector(
                      onTap: () => widget.scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOutCubic,
                      ),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                          'MF',
                          style: AppTextStyles.heading4.copyWith(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Nav links — hidden on mobile
                    if (!isMobile) ...[
                      _NavLink(label: 'About', onTap: () => widget.onNavTap(NavSection.about)),
                      _NavLink(label: 'Experience', onTap: () => widget.onNavTap(NavSection.experience)),
                      _NavLink(label: 'Projects', onTap: () => widget.onNavTap(NavSection.projects)),
                      _NavLink(label: 'Skills', onTap: () => widget.onNavTap(NavSection.skills)),
                      _NavLink(label: 'Contact', onTap: () => widget.onNavTap(NavSection.contact)),
                      const SizedBox(width: 16),
                    ],

                    // Dark mode toggle
                    _ThemeToggle(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTextStyles.navItem.copyWith(
              color: _hovered
                  ? AppColors.accent
                  : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Tooltip(
      message: isDark ? 'Switch to light mode' : 'Switch to dark mode',
      child: InkWell(
        onTap: () {
          themeNotifier.value =
              isDark ? ThemeMode.light : ThemeMode.dark;
        },
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              key: ValueKey(isDark),
              size: 20,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
