import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/screens/show_book_doors_screen.dart';
import 'package:omdat_alhadeth/widgets/books_list_view_widget.dart';

class HomeScreenBodyWidget extends StatelessWidget {
  const HomeScreenBodyWidget({
    super.key,
    required this.themeProvider,
    required this.books,
  });

  final ThemeProvider themeProvider;
  final List<String> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(right: 9.0),
            child: Text(
              "تصنيفات الكتب",
              textAlign: TextAlign.right,

              style: TextStyle(
                fontSize: 18,
                fontFamily: "Amiri",
                fontWeight: FontWeight.w100,
                color: themeProvider.getIsDarkTheme
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),

          BooksListViewWidget(books: books, themeProvider: themeProvider),
        ],
      ),
    );
  }
}
