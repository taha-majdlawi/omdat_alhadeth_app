import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/home_drawer_widget.dart';
import 'package:omdat_alhadeth/widgets/home_screen_body_widget.dart';
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
      body: HomeScreenBodyWidget(themeProvider: themeProvider, books: books),
    );
  }
}
