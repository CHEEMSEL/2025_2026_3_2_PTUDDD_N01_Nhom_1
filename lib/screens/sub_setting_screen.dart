import 'package:flutter/material.dart';

class SubSettingScreen extends StatelessWidget {
  final String title;
  final Widget child;

  const SubSettingScreen({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: child,
    );
  }
}