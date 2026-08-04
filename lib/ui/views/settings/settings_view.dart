import 'package:flutter/material.dart';
import '../../../shared/localization/language_dict.dart';
import '../../widgets/home/floating_dock.dart';
import '../../widgets/settings/setting_item.dart';
import '../../widgets/settings/sub_settings/sub_about_setting.dart';
import '../../widgets/settings/sub_settings/sub_account_setting.dart';
import '../../widgets/settings/sub_settings/sub_battery_setting.dart';
import '../../widgets/settings/sub_settings/sub_notification_setting.dart';
import '../../widgets/settings/sub_settings/sub_security_setting.dart';
import '../../widgets/settings/sub_settings/sub_storage_setting.dart';
import '../../widgets/settings/sub_settings/sub_theme_setting.dart';
import 'sub_setting_view.dart';

/// Tab Cài đặt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

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
      body: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 0),
        child: ListView(
          padding: const EdgeInsets.only(bottom: kDockScrollPadding),
          children: [
            for (final (icon, labelKey, screen) in _settings)
              SettingItem(
                icon: icon,
                title: t(labelKey),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SubSettingView(
                      title: t(labelKey),
                      child: screen,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
