import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';
import 'package:app/widgets/sub-settings/sub-account_setting.dart';
import 'package:app/langs/language_dict.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.person,
      title: AppTranslations.tr(context, 'account'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubSettingScreen(
              iconData: Icons.person,
              title: AppTranslations.tr(context, 'account'),
              child: const SubAccountSetting(),
            ),
          ),
        );
      },
    );
  }
}
