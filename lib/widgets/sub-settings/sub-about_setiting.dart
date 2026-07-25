import 'package:flutter/material.dart';

class SubAboutSetting
    extends StatelessWidget {
  const SubAboutSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
          child: Icon(Icons.info,
              size: 50,
              color: Colors.white),
        ),
        SizedBox(height: 16),
        Text(
          "Ứng dụng của tôi",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22,
              fontWeight:
                  FontWeight.bold),
        ),
        SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                    Icons.info_outline),
                title:
                    Text("Phiên bản"),
                trailing: Text("1.0.0"),
              ),
              Divider(height: 1),
              ListTile(
                leading:
                    Icon(Icons.code),
                title: Text(
                    "Nhà phát triển"),
                trailing:
                    Text("Nhóm 1"),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(
                    Icons.description),
                title: Text("Mô tả"),
                subtitle: Text(
                    "Ứng dụng quản lý thông minh"),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Text(
          "© 2026 Nhóm 1. Tất cả quyền được bảo lưu.",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey,
              fontSize: 12),
        ),
      ],
    );
  }
}
