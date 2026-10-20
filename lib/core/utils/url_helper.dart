import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Safe URL launcher helper
class UrlHelper {
  UrlHelper._();

  static Future<bool> launch(String urlString, {BuildContext? context}) async {
    final uri = Uri.tryParse(urlString);
    if (uri == null) {
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid URL: $urlString')),
        );
      }
      return false;
    }

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open: $urlString')),
        );
      }
      return launched;
    } catch (e) {
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error launching link: $e')),
        );
      }
      return false;
    }
  }
}
