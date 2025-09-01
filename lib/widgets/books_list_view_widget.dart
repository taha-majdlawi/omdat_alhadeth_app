
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';

class BooksListViewWidget extends StatelessWidget {
  const BooksListViewWidget({
    super.key,
    required this.books,
    required this.themeProvider,
  });

  final List<String> books;
  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return Card(
            borderOnForeground: true,
            color: themeProvider.getIsDarkTheme
                ? AppColors.lightCardColor
                : AppColors.darkScaffoldColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                textAlign: TextAlign.right,
                books[index],
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
