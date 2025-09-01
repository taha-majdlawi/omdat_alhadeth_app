import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 181, 178),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 182, 181, 178),
        centerTitle: true,
        title: const Text(
          'عمدة الحديث',
          style: TextStyle(fontFamily: 'Reem Kufi'),
        ),
      ),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
