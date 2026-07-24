import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';

class SecuritySetting
    extends StatelessWidget {
  const SecuritySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.security,
      title: "Bảo mật",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const SubSettingScreen(
              iconData: Icons.security,
              title: "Bảo mật",
            ),
          ),
        );
      },
    );
  }
}
