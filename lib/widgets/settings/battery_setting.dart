import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';
import 'package:app/widgets/sub-settings/sub-battery_setting.dart';
import 'package:app/langs/language_dict.dart';

class BatterySetting extends StatelessWidget {
  const BatterySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.battery_saver,
      title: AppTranslations.tr(context, 'battery'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubSettingScreen(
              iconData: Icons.battery_saver,
              title: AppTranslations.tr(context, 'battery'),
              child: const SubBatterySetting(),
            ),
          ),
        );
      },
    );
  }
}
