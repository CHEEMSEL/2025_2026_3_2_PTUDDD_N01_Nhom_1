import "package:flutter/material.dart";
import 'package:app/tabs/inbox_tab.dart';
import 'package:app/tabs/contact_tab.dart';
import 'package:app/tabs/notification_tab.dart';
import 'package:app/tabs/setting_tab.dart';
import 'package:app/langs/language_dict.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int slectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Center(child: InboxTab()),
      const Center(child: ContactTab()),
      const Center(child: NotificationTab()),
      const Center(child: SettingTab()),
    ];

    return Scaffold(
      body: IndexedStack(
        index: slectedIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[800],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: slectedIndex,
        onTap: (index) {
          setState(() {
            slectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: AppTranslations.tr(context, 'messages'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_pin),
            label: AppTranslations.tr(context, 'contact'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: AppTranslations.tr(context, 'notifications'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: AppTranslations.tr(context, 'settings'),
          ),
        ],
      ),
    );
  }
}
