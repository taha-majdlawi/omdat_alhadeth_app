import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/utils/helpers.dart';
import 'package:omdat_alhadeth/core/utils/widgets/background_wrapper.dart';
import 'package:omdat_alhadeth/core/utils/widgets/hadeth_bottom_sheet.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';



class ShowHadethScreen extends StatelessWidget {
  const ShowHadethScreen({
    super.key,
    required this.themeProvider,
    required this.hadeth,
    required this.hadethNumber,
  });

  final ThemeProvider themeProvider;
  final Hadeth hadeth;
  final int hadethNumber;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return BackgroundWrapper(
      themeProvider: themeProvider,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'الحديث رقم $hadethNumber',
            style: const TextStyle(fontFamily: 'Amiri'),
          ),
        ),

        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text(
              hadeth.hadethText,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Amiri',
                // لو تحب ثبات اللون بغض النظر عن الثيم، استخدم Colors.black87 أو Colors.white
                color: themeProvider.getIsDarkTheme
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  Helpers.openYoutube(context, hadeth.explainUrl ?? ''),
              child: const Text(
                'مشاهدة شرح الحديث للشيخ بن عثيمين',
                style: TextStyle(fontFamily: 'Amiri', fontSize: 18),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),

        // ⬇️ نخلي المشغّل بالأسفل بدون ما يغطي الـ body
        bottomNavigationBar: SafeArea(
          top: false,
          child: HadethScreenBottomSheet(
            soundPathOrUrl: hadeth.soundUrl,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          ),
        ),
      ),
    );
  }
}
