import 'package:flutter/material.dart';

class SubBatterySetting extends StatefulWidget {
  const SubBatterySetting({super.key});

  @override
  State<SubBatterySetting> createState() => _SubBatterySettingState();
}

class _SubBatterySettingState extends State<SubBatterySetting> {
  bool _powerSaving = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.green,
          child: Icon(Icons.battery_saver, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 16),
        const Text(
          "Tiết kiệm pin",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Card(
          child: SwitchListTile(
            title: const Text("Chế độ tiết kiệm pin"),
            subtitle: const Text("Giảm hiệu năng để kéo dài thời gian dùng"),
            value: _powerSaving,
            onChanged: (val) => setState(() => _powerSaving = val),
          ),
        ),
        const Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.battery_alert),
                title: Text("Mức pin hiện tại"),
                trailing: Text("85%"),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.timer),
                title: Text("Thời gian còn lại"),
                trailing: Text("~8 giờ"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
