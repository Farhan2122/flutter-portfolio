import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/utils/url_launcher_helper.dart';

/// Platform enum for store links
enum StorePlatform { playStore, appStore }

/// Button for opening app store links
class StoreLinkButton extends StatelessWidget {
  final String url;
  final StorePlatform platform;

  const StoreLinkButton({super.key, required this.url, required this.platform});

  Future<void> _launchUrl(BuildContext context) async {
    final success = await UrlLauncherHelper.launchExternalUrl(url);
    if (!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open store link'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final icon = platform == StorePlatform.playStore ? Icons.shop : Icons.apple;
    final label = platform == StorePlatform.playStore
        ? 'Play Store'
        : 'App Store';
    final gradient = platform == StorePlatform.playStore
        ? AppColors.primaryGradient
        : AppColors.secondaryGradient;

    return Semantics(
      button: true,
      label: 'Open $label link',
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
          boxShadow: [
            BoxShadow(
              color:
                  (platform == StorePlatform.playStore
                          ? AppColors.primaryGradientStart
                          : AppColors.secondaryGradientStart)
                      .withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _launchUrl(context),
            borderRadius: BorderRadius.circular(
              AppDimensions.buttonBorderRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: AppTextStyles.button.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
