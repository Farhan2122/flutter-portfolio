import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// Utility for launching external URLs and downloading assets
class UrlLauncherHelper {
  // ── CV asset path ──────────────────────────────────────────────────────────
  // Flutter Web serves bundled assets under assets/assets/<original-path>,
  // so the correct relative URL for the download anchor is:
  static const String cvAssetPath =
      'assets/assets/files/Muhammad_Farhan_Flutter_Dev.pdf';
  static const String cvFileName = 'Muhammad_Farhan_Flutter_Dev.pdf';

  /// Download the bundled CV PDF.
  /// On web: triggers a real browser download via an anchor click.
  /// On other platforms: opens the asset URL via url_launcher.
  static void downloadCV() {
    if (kIsWeb) {
      // On Flutter Web, bundled assets are accessible at their asset path
      // as relative URLs. Create a temporary <a> tag with download attribute
      // so the browser saves the file instead of opening it.
      final anchor = html.AnchorElement(href: cvAssetPath)
        ..setAttribute('download', cvFileName)
        ..style.display = 'none';
      html.document.body?.append(anchor);
      anchor.click();
      anchor.remove();
    } else {
      launchExternalUrl(cvAssetPath);
    }
  }

  /// Launch an external URL in the device's browser or app store
  static Future<bool> launchExternalUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint('Cannot launch URL: $url');
        return false;
      }
    } catch (e) {
      debugPrint('Error launching URL: $url, Error: $e');
      return false;
    }
  }

  /// Launch email client with pre-filled email address
  static Future<bool> launchEmail(String email) async {
    try {
      final uri = Uri(scheme: 'mailto', path: email);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri);
      } else {
        debugPrint('Cannot launch email: $email');
        return false;
      }
    } catch (e) {
      debugPrint('Error launching email: $email, Error: $e');
      return false;
    }
  }
}
