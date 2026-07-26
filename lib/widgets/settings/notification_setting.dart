import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';
import 'package:app/widgets/sub-settings/sub-notification_setting.dart';
import 'package:app/langs/language_dict.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.notifications,
      title: AppTranslations.tr(context, 'notification'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubSettingScreen(
              iconData: Icons.notifications,
              title: AppTranslations.tr(context, 'notification'),
              child: const SubNotificationSetting(),
            ),
          ),
        );
      },
    );
  }
}
