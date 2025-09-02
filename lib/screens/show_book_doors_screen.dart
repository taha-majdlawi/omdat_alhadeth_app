import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/doors_item_card_widget.dart';
import 'package:omdat_alhadeth/widgets/item_card_widget.dart';
import 'package:omdat_alhadeth/widgets/show_doors_list_view_widget.dart';

class ShowBookDoorsScreen extends StatelessWidget {
  const ShowBookDoorsScreen({
    super.key,
    required this.themeProvider,
    required this.bookName,
  });
  final ThemeProvider themeProvider;
  final String bookName;
  final List<String> doors = const [
    'باب الاستطابة',
    'باب السواك',
    "باب المسح على الخفين",
    "باب في المذي وغيره",
    "باب الجنابة",
    "باب التيمم",
    "باب الحيض",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightCardColor,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(bookName, style: TextStyle(fontFamily: 'Reem Kufi')),
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
                "تصنيفات الأبواب",
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
            ShowDoorsListView(doors: doors, themeProvider: themeProvider),
          ],
        ),
      ),
    );
  }
}
