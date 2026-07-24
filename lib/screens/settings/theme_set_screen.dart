import 'package:flutter/material.dart';

class ThemeSetScreen extends StatelessWidget {
  const ThemeSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chủ đề'),
      ),
      body: const Center(
        child: Text('Chọn chủ đề của bạn'),
      ),
    );
  }
}
