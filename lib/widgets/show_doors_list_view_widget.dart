import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/doors_item_card_widget.dart';

class ShowDoorsListView extends StatelessWidget {
  const ShowDoorsListView({
    super.key,
    required this.doors,
    required this.themeProvider,
  });

  final List<String> doors;
  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doors.length,
        itemBuilder: (context, index) {
          return DoorsItemCardWidget(
            themeProvider: themeProvider,
            doorName: doors[index],
          );
        },
      ),
    );
  }
}
