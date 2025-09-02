import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/hadeth_item_card_widget.dart';

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
          return HadethItemCardWidget(
            themeProvider: themeProvider,
            hadethText: hadethText[index],
          );
        },
      ),
    );
  }
}

