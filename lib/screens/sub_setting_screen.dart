import 'package:flutter/material.dart';

class SubSettingScreen extends StatelessWidget {
  final IconData? iconData;
  final String title;
  final Widget? child;

  const SubSettingScreen({
    super.key,
    this.iconData,
    required this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: child ??
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconData != null)
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    child: Icon(iconData, size: 50, color: Colors.blue),
                  ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
