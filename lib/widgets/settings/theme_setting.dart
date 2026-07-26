import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';
import 'package:app/widgets/sub-settings/sub-theme_setting.dart';
import 'package:app/langs/language_dict.dart';

class ThemeSetting extends StatelessWidget {
  const ThemeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.color_lens,
      title: AppTranslations.tr(context, 'theme'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubSettingScreen(
              iconData: Icons.color_lens,
              title: AppTranslations.tr(context, 'theme'),
              child: const SubThemeSetting(),
            ),
          ),
        );
      },
    );
  }
}
