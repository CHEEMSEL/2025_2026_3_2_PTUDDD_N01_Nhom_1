import 'package:app/screens/about_screen.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
