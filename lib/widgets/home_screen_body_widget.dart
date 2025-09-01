
import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';

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
    
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return Card(
                  borderOnForeground: true,
                  color: themeProvider.getIsDarkTheme
                      ? AppColors.lightCardColor
                      : AppColors.darkScaffoldColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      textAlign: TextAlign.right,
                      books[index],
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Reem Kufi",
                        color: themeProvider.getIsDarkTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
