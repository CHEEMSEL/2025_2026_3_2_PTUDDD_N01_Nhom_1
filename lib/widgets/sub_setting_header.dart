import 'package:flutter/material.dart';

class SubSettingHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const SubSettingHeader({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: scheme.secondaryContainer,
          child: Icon(icon, size: 50, color: scheme.onSecondaryContainer),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
