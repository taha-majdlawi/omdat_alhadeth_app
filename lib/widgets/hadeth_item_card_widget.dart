
import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/screens/show_hadeth_screen.dart';

class HadethItemCardWidget extends StatelessWidget {
  const HadethItemCardWidget({
    super.key,
    required this.themeProvider,
    required this.hadethText,
  });

  final ThemeProvider themeProvider;
  final String hadethText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
  
          MaterialPageRoute(
            builder: (context) => ShowHadethScreen(themeProvider: themeProvider,),
          ),
        );
      },
      child: Card(
        borderOnForeground: true,
        color: themeProvider.getIsDarkTheme
            ? AppColors.lightCardColor
            : AppColors.darkScaffoldColor,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 15.0,
            bottom: 15.0,
          ),
          child: Text(
            textAlign: TextAlign.right,
            hadethText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 22,
              fontFamily: "Reem Kufi",
              color: themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}