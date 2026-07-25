import 'package:flutter/material.dart';
import 'package:app/screens/sub_setting_screen.dart';
import 'package:app/widgets/setting_item.dart';
import 'package:app/widgets/sub-settings/sub-storage_setting.dart';

class StorageSetting
    extends StatelessWidget {
  const StorageSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingItem(
      icon: Icons.storage,
      title: "Lưu trữ",
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const SubSettingScreen(
              iconData: Icons.storage,
              title: "Lưu trữ",
              child:
                  SubStorageSetting(),
            ),
          ),
        );
      },
    );
  }
}
