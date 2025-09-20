import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_hadethes.dart';
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
    required this.bookNumber,
    required this.doorNumber,
  });

  final ThemeProvider themeProvider;
  final Hadeth hadeth;
  final int hadethNumber;
  final int bookNumber;
  final int doorNumber;

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
            style: const TextStyle(fontFamily: 'Amiri', fontSize: 22),
          ),
        ),

        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text(
              hadeth.hadethText,
              textAlign: TextAlign.right,
              style: TextStyle(
              //  fontSize: 24,
                fontFamily: 'Amiri',

                color: themeProvider.getIsDarkTheme
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            ShowHadethExplainBotton(
              hadeth: hadeth,
              themeProvider: themeProvider,
            ),

            const SizedBox(height: 12),
          ],
        ),

        bottomNavigationBar: SafeArea(
          top: false,
          child: HadethScreenBottomSheet(
            soundPathOrUrl: hadeth.soundUrl,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            hadethsInCurrentDoor:
                Constants.books[bookNumber - 1].doors[doorNumber].hadeths,
            currentHadethIndex: hadethNumber - 1,
            onNavigateToHadeth: (newIndex) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => ShowHadethScreen(
                    themeProvider: themeProvider,
                    hadeth: Constants
                        .books[bookNumber - 1]
                        .doors[doorNumber]
                        .hadeths[newIndex],
                    hadethNumber: newIndex + 1,
                    bookNumber: bookNumber,
                    doorNumber: doorNumber,
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

class ShowHadethExplainBotton extends StatelessWidget {
  const ShowHadethExplainBotton({
    super.key,
    required this.hadeth,
    required this.themeProvider,
  });

  final Hadeth hadeth;
  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Helpers.openYoutube(context, hadeth.explainUrl ?? ''),
      icon: const Icon(Icons.play_circle_fill, size: 24),
      label: Text(
        'مشاهدة شرح الحديث',

        style: const TextStyle(
          fontFamily: 'Amiri',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: themeProvider.getIsDarkTheme
            ? Colors.teal.shade700
            : Colors.teal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 6,
        shadowColor: Colors.black45,
      ),
    );
  }
}
