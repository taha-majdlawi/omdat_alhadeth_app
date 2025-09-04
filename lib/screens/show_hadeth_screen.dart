import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/hadeth_screen_bottom_sheet_widget.dart';

class ShowHadethScreen extends StatelessWidget {
  const ShowHadethScreen({super.key, required this.themeProvider, required this.hadeth});
  final ThemeProvider themeProvider;
  final Hadeth hadeth;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightCardColor,
        title: Text('الحديث رقم 1', style: TextStyle(fontFamily: 'Amiri')),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Amiri',
                  color: themeProvider.getIsDarkTheme
                      ? Colors.white
                      : Colors.black,
                ),
                //     "\u202Bعن عمرَ بنِ الخطابِ رضي الله عنه قال: سمعتُ رسولَ الله ﷺ يقول: «إنما الأعمالُ بالنيَّاتِ – وفي روايةٍ: بالنيَّةِ – وإنما لكلِّ امرئٍ ما نوى. فمَن كانت هجرتُه إلى الله ورسولِه؛ فهجرتُه إلى الله ورسولِه. ومَن كانت هجرتُه إلى دنيا يُصيبُها أو امرأةٍ يتزوَّجُها؛ فهجرتُه إلى ما هاجرَ إليه».\u202C",
                hadeth.hadethText,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: HadethScreenBottomSheet(
        soundUrl: hadeth.soundUrl,
        screenWidth: screenWidth,
        screenHeight: screenHeight,
      ),

    );
  }
}