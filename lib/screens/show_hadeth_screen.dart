import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';

class ShowHadethScreen extends StatelessWidget {
  const ShowHadethScreen({super.key, required this.themeProvider});
  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightCardColor,
        title: Text('الحديث رقم 1', style: TextStyle(fontFamily: 'Amiri')),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('This is the Show Hadeth Screen'),
          ],
        ),
      ),
    );
  }
}
