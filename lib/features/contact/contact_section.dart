import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/utils/responsive_helper.dart';
import '../../core/utils/url_launcher_helper.dart';
import '../../data/repositories/portfolio_repository.dart';
import '../../widgets/animated_visibility.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = ResponsiveHelper.isDesktop(context);
    final contact = PortfolioRepository().getContactInfo();

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
          constraints: const BoxConstraints(maxWidth: 680),
          child: AnimatedVisibility(
            child: Column(
              children: [
                // Section label
                Text(
                  'CONTACT',
                  style: AppTextStyles.overline.copyWith(
                    color: AppColors.accent,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Headline
                Text(
                  'Interested in\nworking together?',
                  style: AppTextStyles.heading1.copyWith(
                    color: isDark ? AppColors.darkText : AppColors.lightText,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                Text(
                  "I'm always open to discussing new projects,\ncreative ideas, or opportunities.",
                  style: AppTextStyles.body.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Email CTA
                _EmailButton(email: contact.email),

                const SizedBox(height: 20),

                // CV download CTA
                _CvDownloadButton(isDark: isDark),

                const SizedBox(height: 40),

                // Divider
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or find me on',
                        style: AppTextStyles.caption.copyWith(
                          color: isDark
                              ? AppColors.darkTextTertiary
                              : AppColors.lightTextTertiary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Social links
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    if (contact.linkedInUrl != null)
                      _SocialButton(
                        icon: FontAwesomeIcons.linkedin,
                        label: 'LinkedIn',
                        url: contact.linkedInUrl!,
                        isDark: isDark,
                      ),
                    if (contact.githubUrl != null)
                      _SocialButton(
                        icon: FontAwesomeIcons.github,
                        label: 'GitHub',
                        url: contact.githubUrl!,
                        isDark: isDark,
                      ),
                    _SocialButton(
                      icon: FontAwesomeIcons.whatsapp,
                      label: 'WhatsApp',
                      url: 'https://wa.me/923184272107',
                      isDark: isDark,
                    ),
                  ],
                ),

                const SizedBox(height: 32),
                // Location
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: isDark
                          ? AppColors.darkTextTertiary
                          : AppColors.lightTextTertiary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Lahore, Pakistan',
                      style: AppTextStyles.caption.copyWith(
                        color: isDark
                            ? AppColors.darkTextTertiary
                            : AppColors.lightTextTertiary,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailButton extends StatefulWidget {
  final String email;
  const _EmailButton({required this.email});

  @override
  State<_EmailButton> createState() => _EmailButtonState();
}

class _EmailButtonState extends State<_EmailButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => UrlLauncherHelper.launchEmail(widget.email),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accentHover : AppColors.accent,
            borderRadius: BorderRadius.circular(
              AppDimensions.buttonBorderRadius,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withOpacity(0.35),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.email,
            style: AppTextStyles.button.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  final FaIconData icon;
  final String label;
  final String url;
  final bool isDark;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.url,
    required this.isDark,
  });

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
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
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accent.withOpacity(0.08)
                : (widget.isDark
                      ? AppColors.darkSurfaceElevated
                      : AppColors.lightBackground),
            borderRadius: BorderRadius.circular(
              AppDimensions.buttonBorderRadius,
            ),
            border: Border.all(
              color: _hovered
                  ? AppColors.accent.withOpacity(0.5)
                  : (widget.isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.icon,
                size: 18,
                color: _hovered
                    ? AppColors.accent
                    : (widget.isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary),
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: AppTextStyles.button.copyWith(
                  color: _hovered
                      ? AppColors.accent
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

class _CvDownloadButton extends StatefulWidget {
  final bool isDark;
  const _CvDownloadButton({required this.isDark});

  @override
  State<_CvDownloadButton> createState() => _CvDownloadButtonState();
}

class _CvDownloadButtonState extends State<_CvDownloadButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => UrlLauncherHelper.downloadCV(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
          decoration: BoxDecoration(
            color: _hovered
                ? (widget.isDark
                      ? AppColors.darkSurfaceElevated
                      : AppColors.lightSurfaceElevated)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(
              AppDimensions.buttonBorderRadius,
            ),
            border: Border.all(
              color: _hovered
                  ? AppColors.accent.withAlpha(128)
                  : (widget.isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder),
              width: 1.5,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withAlpha(20),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.download_rounded,
                size: 20,
                color: _hovered
                    ? AppColors.accent
                    : (widget.isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary),
              ),
              const SizedBox(width: 10),
              Text(
                'Download CV',
                style: AppTextStyles.button.copyWith(
                  color: _hovered
                      ? AppColors.accent
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
