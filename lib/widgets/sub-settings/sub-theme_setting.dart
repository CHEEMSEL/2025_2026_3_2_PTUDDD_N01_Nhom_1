import 'package:flutter/material.dart';

class SubThemeSetting extends StatelessWidget {
  const SubThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.purple,
          child: Icon(Icons.color_lens, size: 50, color: Colors.white),
        ),
        SizedBox(height: 16),
        Text(
          "Giao diện",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.light_mode),
                title: Text("Sáng"),
                subtitle: Text("Giao diện màu sáng"),
                trailing: Icon(Icons.check_circle, color: Colors.blue),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text("Tối"),
                subtitle: Text("Giao diện màu tối"),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.settings_brightness),
                title: Text("Theo hệ thống"),
                subtitle: Text("Tự động theo thiết bị"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
