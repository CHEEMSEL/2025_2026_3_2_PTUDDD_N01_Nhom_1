import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';
import 'package:app/widgets/sub-settings/sub-about_setiting.dart';
import 'package:app/langs/language_dict.dart';

class AboutSetting extends StatelessWidget {
  const AboutSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.info,
      title: AppTranslations.tr(context, 'about_app'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubSettingScreen(
              iconData: Icons.info,
              title: AppTranslations.tr(context, 'about_app'),
              child: const SubAboutSetting(),
            ),
          ),
        );
      },
    );
  }
}
