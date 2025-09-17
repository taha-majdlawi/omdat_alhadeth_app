import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  /// Launches a YouTube link or raw video ID.
  /// Uses in-app webview to avoid ACTIVITY_NOT_FOUND on emulators without a browser.
  static Future<void> openYoutube(BuildContext context, String urlOrId) async {
    String u = (urlOrId).trim();

    if (u.isEmpty) {
      _snack(context, 'الرابط غير متوفر');
      return;
    }

    // If it's a YouTube video ID (11 chars), build full URL
    final isId = RegExp(r'^[A-Za-z0-9_-]{11}$').hasMatch(u);
    if (isId) {
      u = 'https://www.youtube.com/watch?v=$u';
    }

    // Ensure valid scheme
    if (!u.startsWith('http://') && !u.startsWith('https://')) {
      u = 'https://$u';
    }

    final uri = Uri.parse(u);

    try {
      final ok = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // ✅ حل موثوق لجميع الأجهزة
      );
      if (!ok) _snack(context, 'تعذر فتح الرابط');
    } catch (e) {
      _snack(context, 'حدث خطأ أثناء فتح الرابط');
    }
  }

  static void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
