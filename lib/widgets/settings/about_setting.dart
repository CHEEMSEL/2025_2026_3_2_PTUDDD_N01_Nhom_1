import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';

class AboutSetting
    extends StatelessWidget {
  const AboutSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.info,
      title: "Thông tin ứng dụng",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const SubSettingScreen(
              iconData: Icons.info,
              title:
                  "Thông tin ứng dụng",
            ),
          ),
        );
      },
    );
  }
}
