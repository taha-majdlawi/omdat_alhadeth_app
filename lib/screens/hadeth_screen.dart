import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/core/utils/widgets/background_wrapper.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/hadethes_listView_widget.dart';

class HadethsScreen extends StatelessWidget {
  const HadethsScreen({
    super.key,
    required this.themeProvider,
    required this.doorName,
    required this.hadethes,
    required this.doorNumber,
    required this.bookNumber,
  });
  final ThemeProvider themeProvider;
  final String doorName;
  final List<Hadeth> hadethes;

  final int doorNumber;
  final int bookNumber;

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      themeProvider: themeProvider,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          title: Align(
            alignment: Alignment.centerRight,
            child: Text(doorName, style: TextStyle(fontFamily: 'Reem Kufi')),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 9.0),
                child: Text(
                  "الأحاديث الواردة في هذا الباب",
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
              HadethesListView(
                bookNumber: bookNumber,
                doorNumber: doorNumber,
                themeProvider: themeProvider,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
