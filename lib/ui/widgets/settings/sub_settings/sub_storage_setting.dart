import 'package:flutter/material.dart';
import 'package:app/shared/localization/language_dict.dart';
import 'package:app/ui/widgets/settings/sub_setting_header.dart';

class SubStorageSetting extends StatelessWidget {
  const SubStorageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    String t(String key) => AppTranslations.tr(context, key);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SubSettingHeader(icon: Icons.storage, title: t('storage')),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t('used_storage'),
                  style: textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 0.45,
                    minHeight: 12,
                    backgroundColor: scheme.surfaceContainerHighest,
                  ),
                ),
                const SizedBox(height: 8),
                const Text("4.5 GB / 10 GB"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: [
              _storageTile(Icons.image, t('images'), "2.1 GB"),
              const Divider(height: 1),
              _storageTile(Icons.video_library, t('video'), "1.5 GB"),
              const Divider(height: 1),
              _storageTile(Icons.audiotrack, t('audio'), "0.4 GB"),
              const Divider(height: 1),
              _storageTile(Icons.insert_drive_file, t('documents'), "0.5 GB"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _storageTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Text(value),
    );
  }
}