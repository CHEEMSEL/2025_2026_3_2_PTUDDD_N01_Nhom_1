import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class SubAccountSetting extends StatelessWidget {
  const SubAccountSetting({super.key});

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
          child: Icon(Icons.person, size: 50, color: scheme.onSecondaryContainer),
        ),
        const SizedBox(height: 16),
        Text(
          "Nguyễn Văn A",
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
        ),
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
                title: Text(AppTranslations.tr(context, 'phone')),
                trailing: const Text("0123 456 789"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(AppTranslations.tr(context, 'birthday')),
                trailing: const Text("01/01/2000"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.wc),
                title: Text(AppTranslations.tr(context, 'gender')),
                trailing: Text(AppTranslations.tr(context, 'male')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
