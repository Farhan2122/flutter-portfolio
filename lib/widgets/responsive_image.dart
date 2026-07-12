import 'package:flutter/material.dart';
import '../core/constants/app_dimensions.dart';
import 'loading_indicator.dart';

/// Responsive image widget with loading and error states
class ResponsiveImage extends StatelessWidget {
  final String url;
  final double? aspectRatio;

  const ResponsiveImage({super.key, required this.url, this.aspectRatio});

  void _showFullScreenImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                color: Colors.black87,
                child: Center(
                  child: InteractiveViewer(
                    child: Image.network(url, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 32),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth - (AppDimensions.pagePadding * 2);

    return GestureDetector(
      onTap: () => _showFullScreenImage(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.imageBorderRadius),
        child: AspectRatio(
          aspectRatio: aspectRatio ?? 1.0,
          child: Image.network(
            url,
            width: imageWidth,
            fit: BoxFit.cover,
            cacheWidth: imageWidth.toInt(),
            cacheHeight: aspectRatio != null
                ? (imageWidth / aspectRatio!).toInt()
                : imageWidth.toInt(),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: LoadingIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: AppDimensions.iconSizeLarge,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
