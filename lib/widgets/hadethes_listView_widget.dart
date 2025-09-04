import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/core/constants/app_hadethes.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/hadeth_item_card_widget.dart';

class HadethesListView extends StatelessWidget {
  const HadethesListView({
    super.key,
 
    required this.themeProvider, required this.bookNumber, required this.doorNumber,
  });

 
  final ThemeProvider themeProvider;
  final int bookNumber;
  final int doorNumber;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: Constants.books[bookNumber-1].doors[doorNumber].hadeths.length,
        itemBuilder: (context, index) {
          return HadethItemCardWidget(
            hadethNumber: index+1,
            themeProvider: themeProvider,
            hadeth: Constants.books[bookNumber-1].doors[doorNumber].hadeths[index],
          );
        },
      ),
    );
  }
}

