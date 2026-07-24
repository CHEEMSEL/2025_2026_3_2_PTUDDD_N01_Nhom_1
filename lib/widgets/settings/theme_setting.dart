import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';

class ThemeSetting
    extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.color_lens,
      title: "Giao diện",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const SubSettingScreen(
              iconData:
                  Icons.color_lens,
              title: "Giao diện",
            ),
          ),
        );
      },
    );
  }
}
