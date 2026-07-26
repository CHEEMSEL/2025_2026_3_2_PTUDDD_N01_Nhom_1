import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class SubStorageSetting extends StatelessWidget {
  const SubStorageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.teal,
          child: Icon(Icons.storage, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          AppTranslations.tr(context, 'storage'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTranslations.tr(context, 'used_storage'),
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const LinearProgressIndicator(
                    value: 0.45,
                    minHeight: 12,
                    backgroundColor: Colors.grey,
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
              ListTile(
                leading: const Icon(Icons.image),
                title: Text(AppTranslations.tr(context, 'images')),
                trailing: const Text("2.1 GB"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.video_library),
                title: Text(AppTranslations.tr(context, 'video')),
                trailing: const Text("1.5 GB"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.audiotrack),
                title: Text(AppTranslations.tr(context, 'audio')),
                trailing: const Text("0.4 GB"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.insert_drive_file),
                title: Text(AppTranslations.tr(context, 'documents')),
                trailing: const Text("0.5 GB"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
