import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/hadeth_screen_bottom_sheet_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowHadethScreen extends StatelessWidget {
  const ShowHadethScreen({
    super.key,
    required this.themeProvider,
    required this.hadeth,
  });

  final ThemeProvider themeProvider;
  final Hadeth hadeth;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth  = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightCardColor,
        centerTitle: true,
        title: const Text('الحديث رقم 1', style: TextStyle(fontFamily: 'Amiri')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              hadeth.hadethText,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Amiri',
                color: themeProvider.getIsDarkTheme ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.25),

            // Launch YouTube
            ElevatedButton(
              onPressed: () => _openYoutube(context, hadeth.explainUrl ?? ''),
              child: const Text(
                'مشاهدة شرح الحديث للشيخ بن عثيمين',
                style: TextStyle(fontFamily: 'Amiri', fontSize: 18),
              ),
            ),
          ],
        ),
      ),

      // Your audio bottom sheet
      bottomSheet: HadethScreenBottomSheet(
        soundPathOrUrl: hadeth.soundUrl,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
      ),
    );
  }

  /// Launches a YouTube link or raw video ID.
  /// Uses in-app webview to avoid ACTIVITY_NOT_FOUND on emulators without a browser.
  Future<void> _openYoutube(BuildContext context, String urlOrId) async {
    String u = (urlOrId).trim();

    if (u.isEmpty) {
      _snack(context, 'الرابط غير متوفر');
      return;
    }

    // If it's just a YouTube video ID (11 chars), build a full URL
    final isId = RegExp(r'^[A-Za-z0-9_-]{11}$').hasMatch(u);
    if (isId) {
      u = 'https://www.youtube.com/watch?v=$u';
    }

    // Ensure http/https scheme
    if (!u.startsWith('http://') && !u.startsWith('https://')) {
      u = 'https://$u';
    }

    final uri = Uri.parse(u);

    try {
      // Prefer in-app webview for reliability on emulators
      final ok = await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(enableJavaScript: true),
      );
      if (!ok) _snack(context, 'تعذر فتح الرابط');
    } catch (_) {
      _snack(context, 'تعذر فتح الرابط');
    }
  }

  void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
