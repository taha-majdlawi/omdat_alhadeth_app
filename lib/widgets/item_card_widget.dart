import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/screens/show_book_doors_screen.dart';

class BookItemCard extends StatelessWidget {
  const BookItemCard({
    super.key,
    required this.themeProvider,
    required this.bookName, required this.bookNumber, 
  });

  final ThemeProvider themeProvider;
  final String bookName;
  final int bookNumber ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ShowBookDoorsScreen(
              bookNumber: bookNumber,
              themeProvider: themeProvider,
              bookName: bookName,
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
      ),
    );
  }
}
