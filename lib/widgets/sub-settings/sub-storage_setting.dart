import 'package:flutter/material.dart';

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
        const Text(
          "Lưu trữ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Dung lượng đã dùng",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
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
        const Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Hình ảnh"),
                trailing: Text("2.1 GB"),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.video_library),
                title: Text("Video"),
                trailing: Text("1.5 GB"),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.audiotrack),
                title: Text("Âm thanh"),
                trailing: Text("0.4 GB"),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.insert_drive_file),
                title: Text("Tài liệu"),
                trailing: Text("0.5 GB"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
