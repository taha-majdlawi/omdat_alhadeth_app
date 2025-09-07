import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/core/utils/widgets/background_wrapper.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/home_drawer_widget.dart';
import 'package:omdat_alhadeth/widgets/home_screen_body_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BackgroundWrapper(
      themeProvider: themeProvider,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: HomeDrawerWidget(themeProvider: themeProvider),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'عمدة الحديث',
            style: TextStyle(fontFamily: 'Reem Kufi'),
          ),
        ),
        body: HomeScreenBodyWidget(themeProvider: themeProvider),
      ),
    );
  }
}
