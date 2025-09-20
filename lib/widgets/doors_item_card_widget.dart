import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/core/constants/app_hadethes.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/screens/hadeth_screen.dart';

class DoorsItemCardWidget extends StatelessWidget {
  const DoorsItemCardWidget({
    super.key,
    required this.themeProvider,
    required this.doorNumber,
    required this.bookNumber,
  });

  final ThemeProvider themeProvider;
  final int doorNumber;
  final int bookNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HadethsScreen(
              themeProvider: themeProvider,
              doorName: Constants.books[bookNumber - 1].doors[doorNumber ].doorName,
              hadethes: Constants.books[bookNumber - 1].doors[doorNumber ].hadeths,
              bookNumber: bookNumber,
              doorNumber: doorNumber,
            ),
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
            Constants.books[bookNumber - 1].doors[doorNumber ].doorName,
            style: TextStyle(
             // fontSize: 22,
              fontFamily: "Reem Kufi",
              color: themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
