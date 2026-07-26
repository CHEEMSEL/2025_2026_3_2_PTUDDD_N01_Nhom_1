import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class SubAccountSetting extends StatelessWidget {
  const SubAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 16),
        const Text(
          "Nguyễn Văn A",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Text(
          "nguyenvana@email.com",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
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
