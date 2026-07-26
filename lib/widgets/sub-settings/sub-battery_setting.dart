import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

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
        Text(
          AppTranslations.tr(context, 'battery'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Card(
          child: SwitchListTile(
            title: Text(AppTranslations.tr(context, 'power_save_mode')),
            subtitle: Text(AppTranslations.tr(context, 'power_save_desc')),
            value: _powerSaving,
            onChanged: (val) => setState(() => _powerSaving = val),
          ),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.battery_alert),
                title: Text(AppTranslations.tr(context, 'current_battery')),
                trailing: const Text("85%"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.timer),
                title: Text(AppTranslations.tr(context, 'remaining_time')),
                trailing: const Text("~8 giờ"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
