import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';
import 'package:app/widgets/sub-settings/sub-notification_setting.dart';

class NotificationSetting
    extends StatelessWidget {
  const NotificationSetting(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.notifications,
      title: "Thông báo",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const SubSettingScreen(
              iconData:
                  Icons.notifications,
              title: "Thông báo",
              child:
                  SubNotificationSetting(),
            ),
          ),
        );
      },
    );
  }
}
