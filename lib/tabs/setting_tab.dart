import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';
import 'package:app/widgets/sub-settings/sub-about_setiting.dart';
import 'package:app/widgets/sub-settings/sub-account_setting.dart';
import 'package:app/widgets/sub-settings/sub-battery_setting.dart';
import 'package:app/widgets/sub-settings/sub-notification_setting.dart';
import 'package:app/widgets/sub-settings/sub-security_setting.dart';
import 'package:app/widgets/sub-settings/sub-storage_setting.dart';
import 'package:app/widgets/sub-settings/sub-theme_setting.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  static const _settings = [
    (Icons.person, 'account', SubAccountSetting()),
    (Icons.notifications, 'notification', SubNotificationSetting()),
    (Icons.security, 'security', SubSecuritySetting()),
    (Icons.color_lens, 'theme', SubThemeSetting()),
    (Icons.storage, 'storage', SubStorageSetting()),
    (Icons.battery_saver, 'battery', SubBatterySetting()),
    (Icons.info, 'about', SubAboutSetting()),
  ];

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return Scaffold(
      appBar: AppBar(title: Text(t('settings'))),
      body: ListView(
        children: [
          for (final (icon, labelKey, screen) in _settings)
            SettingItem(
              icon: icon,
              title: t(labelKey),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SubSettingScreen(
                    title: t(labelKey),
                    child: screen,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}