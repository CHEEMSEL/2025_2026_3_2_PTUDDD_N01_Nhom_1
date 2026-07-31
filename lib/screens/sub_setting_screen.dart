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
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: Icon(
                      iconData,
                      size: 50,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
    );
  }
}
