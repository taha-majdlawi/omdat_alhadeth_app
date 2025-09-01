import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/screens/home_screen.dart';

void main() {
  runApp(const OmdatAlhadeth());
}

class OmdatAlhadeth extends StatelessWidget {
  const OmdatAlhadeth({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:  HomeScreen());
  }
}
