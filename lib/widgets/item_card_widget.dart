import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.themeProvider,
    required this.bookName,
  });

  final ThemeProvider themeProvider;
  final String bookName;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: themeProvider.getIsDarkTheme
          ? AppColors.lightCardColor
          : AppColors.darkScaffoldColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          textAlign: TextAlign.right,
          bookName,
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Reem Kufi",
            color: themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
