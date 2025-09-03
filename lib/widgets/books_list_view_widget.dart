import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/core/constants/app_hadethes.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/screens/show_book_doors_screen.dart';
import 'package:omdat_alhadeth/widgets/item_card_widget.dart';

class BooksListViewWidget extends StatelessWidget {
  const BooksListViewWidget({
    super.key,

    required this.themeProvider,
  
  });

  final ThemeProvider themeProvider;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: Constants.books.length,
        itemBuilder: (context, index) {
          return BookItemCard(
          
            themeProvider: themeProvider,
            bookName: Constants.books[index].bookName,
          );
        },
      ),
    );
  }
}
