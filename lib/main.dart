import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/theme_data.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/screens/home_screen.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const OmdatAlhadeth());
}

class OmdatAlhadeth extends StatelessWidget {
  const OmdatAlhadeth({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme,
              context: context,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
