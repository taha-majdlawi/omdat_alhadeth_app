
import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';

class HadethesListView extends StatelessWidget {
  const HadethesListView({
    super.key,
    required this.hadethText,
    required this.themeProvider,
  });

  final List<String> hadethText;
  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: hadethText.length,
        itemBuilder: (context, index) {
          return Card(
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
                hadethText[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Reem Kufi",
                  color: themeProvider.getIsDarkTheme
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
