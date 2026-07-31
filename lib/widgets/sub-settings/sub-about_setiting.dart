import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class SubAboutSetting extends StatelessWidget {
  const SubAboutSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: scheme.secondaryContainer,
          child: Icon(Icons.info, size: 50, color: scheme.onSecondaryContainer),
        ),
        const SizedBox(height: 16),
        Text(
          AppTranslations.tr(context, 'app_title'),
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(AppTranslations.tr(context, 'version')),
                trailing: const Text("1.0.0"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.code),
                title: Text(AppTranslations.tr(context, 'developer')),
                trailing: Text(AppTranslations.tr(context, 'team1')),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.description),
                title: Text(AppTranslations.tr(context, 'description')),
                subtitle: Text(AppTranslations.tr(context, 'app_description')),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppTranslations.tr(context, 'copyright'),
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
