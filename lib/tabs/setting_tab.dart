import 'package:flutter/material.dart';
import 'package:app/widgets/settings/account_setting.dart';
import 'package:app/widgets/settings/about_setting.dart';
import 'package:app/widgets/settings/battery_setting.dart';
import 'package:app/widgets/settings/notification_setting.dart';
import 'package:app/widgets/settings/security_setting.dart';
import 'package:app/widgets/settings/storage_setting.dart';
import 'package:app/widgets/settings/theme_setting.dart';

class SettingTab
    extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: const [
          AccountSetting(),
          NotificationSetting(),
          SecuritySetting(),
          ThemeSetting(),
          StorageSetting(),
          BatterySetting(),
          AboutSetting(),
        ],
      ),
    );
  }
}
