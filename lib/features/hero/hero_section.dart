import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/utils/url_launcher_helper.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;

  const HeroSection({super.key, required this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final screenHeight = MediaQuery.of(context).size.height;

    // Use explicit height so Stack gets a bounded parent (no infinite constraint)
    final heroHeight = (screenHeight * 0.92).clamp(600.0, 1000.0);

    return SizedBox(
      width: double.infinity,
      height: heroHeight,
      child: Stack(
        fit: StackFit.expand, // fills the explicit SizedBox — no infinite
        children: [
          // ── Background color fill ──────────────────────────────────────
          Container(
            color: isDark
                ? AppColors.darkBackground
                : AppColors.lightBackground,
          ),

          // ── Animated blobs (positioned, never expand) ──────────────────
          _AnimatedBlobs(isDark: isDark),

          // ── Foreground content ─────────────────────────────────────────
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppDimensions.maxContentWidth,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop
                      ? AppDimensions.pagePaddingDesktop
                      : AppDimensions.pagePaddingMobile,
                  vertical: 80,
                ),
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                            child: _HeroText(
                              isDark: isDark,
                              onViewProjects: onViewProjects,
                            ),
                          ),
                          const SizedBox(width: 80),
                          Expanded(flex: 4, child: _HeroVisual(isDark: isDark)),
                        ],
                      )
                    : SingleChildScrollView(
                        // Wrap mobile column to avoid overflow on small screens
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _HeroText(
                              isDark: isDark,
                              onViewProjects: onViewProjects,
                            ),
                            const SizedBox(height: 60),
                            Center(child: _HeroVisual(isDark: isDark)),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Hero text ─────────────────────────────────────────────────────────────────
class _HeroText extends StatelessWidget {
  final bool isDark;
  final VoidCallback onViewProjects;

  const _HeroText({required this.isDark, required this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppDimensions.breakpointMobile;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Role badge
        Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.accent.withAlpha(25),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.accent.withAlpha(76)),
              ),
              child: Text(
                'Flutter Developer · CODELOUNGE',
                style: AppTextStyles.label.copyWith(color: AppColors.accent),
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms, curve: Curves.easeOut)
            .slideY(
              begin: 0.3,
              end: 0,
              duration: 600.ms,
              curve: Curves.easeOut,
            ),

        const SizedBox(height: 28),

        // Name
        Text(
              'Muhammad\nFarhan',
              style: (isMobile ? AppTextStyles.heading1 : AppTextStyles.display)
                  .copyWith(
                    color: isDark ? AppColors.darkText : AppColors.lightText,
                  ),
            )
            .animate()
            .fadeIn(delay: 100.ms, duration: 700.ms, curve: Curves.easeOut)
            .slideY(
              begin: 0.3,
              end: 0,
              delay: 100.ms,
              duration: 700.ms,
              curve: Curves.easeOut,
            ),

        const SizedBox(height: 20),

        // Tagline
        Text(
              'Building enterprise-grade mobile\napplications with Flutter.',
              style: AppTextStyles.bodyLarge.copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            )
            .animate()
            .fadeIn(delay: 250.ms, duration: 700.ms, curve: Curves.easeOut)
            .slideY(
              begin: 0.3,
              end: 0,
              delay: 250.ms,
              duration: 700.ms,
              curve: Curves.easeOut,
            ),

        const SizedBox(height: 48),

        // CTA buttons
        Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _HeroButton(
                  label: 'View Projects',
                  isPrimary: true,
                  onTap: onViewProjects,
                ),
                _HeroButton(
                  label: 'Download Resume',
                  isPrimary: false,
                  icon: Icons.download_rounded,
                  onTap: () => UrlLauncherHelper.downloadCV(),
                ),
              ],
            )
            .animate()
            .fadeIn(delay: 400.ms, duration: 700.ms, curve: Curves.easeOut)
            .slideY(
              begin: 0.3,
              end: 0,
              delay: 400.ms,
              duration: 700.ms,
              curve: Curves.easeOut,
            ),
      ],
    );
  }
}

class _HeroButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;
  final IconData? icon;
  const _HeroButton({
    required this.label,
    required this.isPrimary,
    required this.onTap,
    this.icon,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = widget.isPrimary
        ? Colors.white
        : (isDark ? AppColors.darkText : AppColors.lightText);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.buttonPaddingH,
            vertical: AppDimensions.buttonPaddingV,
          ),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_hovered ? AppColors.accentHover : AppColors.accent)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(
              AppDimensions.buttonBorderRadius,
            ),
            border: widget.isPrimary
                ? null
                : Border.all(
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                    width: 1.5,
                  ),
            boxShadow: widget.isPrimary && _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withAlpha(76),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 18, color: textColor),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: AppTextStyles.button.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Floating app cards visual ─────────────────────────────────────────────────
class _HeroVisual extends StatelessWidget {
  final bool isDark;
  const _HeroVisual({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 400,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Glow circle
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.accent.withAlpha(38),
                      AppColors.accent.withAlpha(0),
                    ],
                  ),
                ),
              ),
              ..._buildFloatingCards(isDark),
            ],
          ),
        )
        .animate()
        .fadeIn(delay: 300.ms, duration: 800.ms)
        .scale(
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
          delay: 300.ms,
          duration: 800.ms,
          curve: Curves.easeOutQuart,
        );
  }

  List<Widget> _buildFloatingCards(bool isDark) {
    final cards = [
      (
        label: 'CEERTIF AI',
        sub: 'Workforce Management',
        angle: -8.0,
        offset: const Offset(-60, -80),
        scale: 0.9,
      ),
      (
        label: 'WattAudit',
        sub: 'Energy Analytics',
        angle: 5.0,
        offset: const Offset(50, 20),
        scale: 1.0,
      ),
      (
        label: 'Quick Quran Learning Urdu',
        sub: 'Tadrees ul Qurans',
        angle: -3.0,
        offset: const Offset(-30, 100),
        scale: 0.85,
      ),
    ];

    return [
      for (int i = 0; i < cards.length; i++)
        Transform.translate(
          offset: cards[i].offset,
          child: Transform.rotate(
            angle: cards[i].angle * math.pi / 180,
            child: Transform.scale(
              scale: cards[i].scale,
              child:
                  _AppCard(
                        label: cards[i].label,
                        sub: cards[i].sub,
                        isDark: isDark,
                      )
                      .animate(onPlay: (c) => c.repeat(reverse: true))
                      .moveY(
                        begin: 0,
                        end: i.isEven ? -12 : 10,
                        duration: Duration(milliseconds: 3000 + i * 600),
                        curve: Curves.easeInOut,
                      ),
            ),
          ),
        ),
    ];
  }
}

class _AppCard extends StatelessWidget {
  final String label;
  final String sub;
  final bool isDark;
  const _AppCard({
    required this.label,
    required this.sub,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceElevated.withAlpha(217)
            : Colors.white.withAlpha(230),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDark ? 102 : 20),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.accent.withAlpha(38),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.phone_android_rounded,
              color: AppColors.accent,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.caption.copyWith(
                    color: isDark ? AppColors.darkText : AppColors.lightText,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  sub,
                  style: AppTextStyles.overline.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                    letterSpacing: 0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Animated background blobs ─────────────────────────────────────────────────
// Uses Positioned children only — never SizedBox.expand() — so it works
// inside a Stack with StackFit.expand without causing infinite constraints.
class _AnimatedBlobs extends StatelessWidget {
  final bool isDark;
  const _AnimatedBlobs({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: _Blob(
              size: 500,
              color: AppColors.blobBlue.withAlpha(isDark ? 153 : 255),
              duration: const Duration(seconds: 8),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: _Blob(
              size: 400,
              color: AppColors.blobPurple.withAlpha(isDark ? 127 : 255),
              duration: const Duration(seconds: 11),
            ),
          ),
          Positioned(
            top: 200,
            left: 100,
            child: _Blob(
              size: 300,
              color: AppColors.blobCyan.withAlpha(isDark ? 102 : 255),
              duration: const Duration(seconds: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  final double size;
  final Color color;
  final Duration duration;
  const _Blob({
    required this.size,
    required this.color,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .scaleXY(
          begin: 1.0,
          end: 1.15,
          duration: duration,
          curve: Curves.easeInOut,
        )
        .blur(
          begin: const Offset(60, 60),
          end: const Offset(80, 80),
          duration: duration,
        );
  }
}
