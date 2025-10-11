import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/theme_data.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/providers/font_size_provider.dart';
import 'package:omdat_alhadeth/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:omdat_alhadeth/screens/book_showcase_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final seenBookShowcase = prefs.getBool('seenBookShowcase') ?? false;

  runApp(OmdatAlhadeth(seenBookShowcase: seenBookShowcase));
}

class OmdatAlhadeth extends StatelessWidget {
  final bool seenBookShowcase;

  const OmdatAlhadeth({super.key, required this.seenBookShowcase});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FontSizeProvider()),
      ],
      child: Consumer2<ThemeProvider, FontSizeProvider>(
        builder: (context, themeProvider, fontSizeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme,
              context: context,
            ).copyWith(
              textTheme: Theme.of(context).textTheme.apply(
                    fontSizeFactor: fontSizeProvider.fontSize / 16.0,
                  ),
            ),

            // Conditional home based on first launch
            home: seenBookShowcase
                ?  SplashScreen()      // If seen before, go to your app
                :  BookShowcaseScreen(), // Otherwise, show book showcase first
          );
        },
      ),
    );
  }
}
