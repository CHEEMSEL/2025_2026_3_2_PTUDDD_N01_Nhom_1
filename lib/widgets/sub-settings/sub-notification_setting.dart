import 'package:flutter/material.dart';

class SubNotificationSetting extends StatefulWidget {
  const SubNotificationSetting({super.key});

  @override
  State<SubNotificationSetting> createState() => _SubNotificationSettingState();
}

class _SubNotificationSettingState extends State<SubNotificationSetting> {
  bool _pushEnabled = true;
  bool _emailEnabled = false;
  bool _smsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.orange,
          child: Icon(Icons.notifications, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 16),
        const Text(
          "Thông báo",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              SwitchListTile(
                title: const Text("Thông báo đẩy"),
                subtitle: const Text("Nhận thông báo qua ứng dụng"),
                value: _pushEnabled,
                onChanged: (val) => setState(() => _pushEnabled = val),
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text("Thông báo email"),
                subtitle: const Text("Nhận thông báo qua email"),
                value: _emailEnabled,
                onChanged: (val) => setState(() => _emailEnabled = val),
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: const Text("Thông báo SMS"),
                subtitle: const Text("Nhận thông báo qua tin nhắn"),
                value: _smsEnabled,
                onChanged: (val) => setState(() => _smsEnabled = val),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
