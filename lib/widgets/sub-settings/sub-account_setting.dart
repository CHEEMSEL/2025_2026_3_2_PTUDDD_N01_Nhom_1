import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';
import 'package:app/widgets/sub_setting_header.dart';

class SubAccountSetting extends StatelessWidget {
  const SubAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    String t(String key) => AppTranslations.tr(context, key);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SubSettingHeader(icon: Icons.person, title: "Nguyễn Văn A"),
        Text(
          "nguyenvana@email.com",
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
        ),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text(t('phone')),
                trailing: const Text("0123 456 789"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(t('birthday')),
                trailing: const Text("01/01/2000"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.wc),
                title: Text(t('gender')),
                trailing: Text(t('male')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}