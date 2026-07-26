import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';
import 'package:app/widgets/sub-settings/sub-security_setting.dart';
import 'package:app/langs/language_dict.dart';

class SecuritySetting extends StatelessWidget {
  const SecuritySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.security,
      title: AppTranslations.tr(context, 'security'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubSettingScreen(
              iconData: Icons.security,
              title: AppTranslations.tr(context, 'security'),
              child: const SubSecuritySetting(),
            ),
          ),
        );
      },
    );
  }
}
