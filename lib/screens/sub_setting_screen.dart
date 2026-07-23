import 'package:flutter/material.dart';

class SubSettingScreen extends StatelessWidget {
  final IconData iconData;
  final String title;

  const SubSettingScreen({
    super.key,
    required this.iconData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Icon(
          iconData,
          size: 150,
          color: Colors.blue,
        ),
      ),
    );
  }
}
