import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';
import 'package:app/widgets/sub_setting_header.dart';

class SubAboutSetting extends StatelessWidget {
  const SubAboutSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    String t(String key) => AppTranslations.tr(context, key);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SubSettingHeader(icon: Icons.info, title: t('app_title')),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(t('version')),
                trailing: const Text("1.0.0"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.code),
                title: Text(t('developer')),
                trailing: Text(t('team1')),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.description),
                title: Text(t('description')),
                subtitle: Text(t('app_description')),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          t('copyright'),
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
        ),
      ],
    );
  }
}