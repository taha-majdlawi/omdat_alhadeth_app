import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/theme_data.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/providers/font_size_provider.dart';
import 'package:omdat_alhadeth/screens/home_screen.dart';
import 'package:omdat_alhadeth/screens/splash_screen.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const OmdatAlhadeth());
}

class OmdatAlhadeth extends StatelessWidget {
  const OmdatAlhadeth({super.key});

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
            theme:
                Styles.themeData(
                  isDarkTheme: themeProvider.getIsDarkTheme,
                  context: context,
                ).copyWith(
                  textTheme: Theme.of(context).textTheme.apply(
                    fontSizeFactor: fontSizeProvider.fontSize / 16.0,
                  ),
                ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
