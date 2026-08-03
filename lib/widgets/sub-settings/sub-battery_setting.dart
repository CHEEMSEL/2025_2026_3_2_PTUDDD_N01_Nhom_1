import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';
import 'package:app/widgets/sub_setting_header.dart';

class SubBatterySetting extends StatefulWidget {
  const SubBatterySetting({super.key});

  @override
  State<SubBatterySetting> createState() => _SubBatterySettingState();
}

class _SubBatterySettingState extends State<SubBatterySetting> {
  bool _powerSaving = false;

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SubSettingHeader(icon: Icons.battery_saver, title: t('battery')),
        const SizedBox(height: 24),
        Card(
          child: SwitchListTile(
            title: Text(t('power_save_mode')),
            subtitle: Text(t('power_save_desc')),
            value: _powerSaving,
            onChanged: (val) => setState(() => _powerSaving = val),
          ),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.battery_alert),
                title: Text(t('current_battery')),
                trailing: const Text("85%"),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.timer),
                title: Text(t('remaining_time')),
                trailing: const Text("~8 giờ"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}