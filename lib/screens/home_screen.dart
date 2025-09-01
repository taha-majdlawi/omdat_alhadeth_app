import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/home_drawer_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final List<String> books = const [
    'كتاب الصلاة',
    'كتاب الزكاة',
    'كتاب الصيام',
    'كتاب الحج',
  ];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      drawer: HomeDrawerWidget(themeProvider: themeProvider),
      appBar: AppBar(
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightCardColor,
        centerTitle: true,
        title: const Text(
          'عمدة الحديث',
          style: TextStyle(fontFamily: 'Reem Kufi'),
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
                "تصنيفات الكتب",
                textAlign: TextAlign.right,

                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Reem Kufi",
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
      ),
    );
  }
}
