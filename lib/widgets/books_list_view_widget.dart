import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/item_card_widget.dart';

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
          return ItemCard(themeProvider: themeProvider, bookName: books[index]);
        },
      ),
    );
  }
}
