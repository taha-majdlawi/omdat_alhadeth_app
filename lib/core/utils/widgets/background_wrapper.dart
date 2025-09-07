import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';

/// Reusable background wrapper for all screens.
class BackgroundWrapper extends StatelessWidget {
  const BackgroundWrapper({
    super.key,
    required this.child,
    required this.themeProvider,
  });
  final ThemeProvider themeProvider;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: themeProvider.getIsDarkTheme
              ? AssetImage('assets/images/dark_background_image.png')
              : AssetImage('assets/images/light_background_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}