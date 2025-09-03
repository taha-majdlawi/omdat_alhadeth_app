import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_hadethes.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/doors_item_card_widget.dart';

class ShowDoorsListView extends StatelessWidget {
  const ShowDoorsListView({
    super.key,
  
    required this.themeProvider, required this.bookNumber, 
  });

 
  final ThemeProvider themeProvider;
  final int bookNumber;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount:Constants.books[bookNumber-1].doors.length,
        itemBuilder: (context, index) {
          return DoorsItemCardWidget(
            themeProvider: themeProvider,
            doorNumber: index ,
            bookNumber: bookNumber,
          );
        },
      ),
    );
  }
}
