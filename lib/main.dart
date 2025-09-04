import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/theme_data.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/screens/home_screen.dart';
import 'package:provider/provider.dart';


import 'package:just_audio_media_kit/just_audio_media_kit.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // فعّل media_kit فقط لـ iOS (وأوقفه على Android)
  JustAudioMediaKit.ensureInitialized(
    iOS: true,
    android: false,
    macOS: false,
    windows: false,
    linux: false,
  );

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
            title: 'Flutter Demo',
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
