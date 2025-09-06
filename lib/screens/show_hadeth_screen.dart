import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/core/utils/helpers.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/hadeth_screen_bottom_sheet_widget.dart';

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightCardColor,
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
              color: themeProvider.getIsDarkTheme ? Colors.white : Colors.black,
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

      // ✅ Use bottomNavigationBar so body ends before the player
      bottomNavigationBar: SafeArea(
        top: false,
        child: HadethScreenBottomSheet(
          soundPathOrUrl: hadeth.soundUrl,
          screenWidth: screenWidth,
          screenHeight: screenHeight,
        ),
      ),
    );
  }
}
