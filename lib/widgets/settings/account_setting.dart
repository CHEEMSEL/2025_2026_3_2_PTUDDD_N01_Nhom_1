import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';

class AccountSetting
    extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.person,
      title: "Tài khoản",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const SubSettingScreen(
              iconData: Icons.person,
              title: "Tài khoản",
            ),
          ),
        );
      },
    );
  }
}
