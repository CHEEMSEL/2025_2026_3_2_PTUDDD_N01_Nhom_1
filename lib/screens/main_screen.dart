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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    final tabs = [
      const InboxTab(),
      const ContactTab(),
      const NotificationTab(),
      const SettingTab(),
    ];

    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => selectedIndex = index),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.message), label: t('messages')),
          NavigationDestination(
              icon: const Icon(Icons.person_pin), label: t('contact')),
          NavigationDestination(
              icon: const Icon(Icons.notifications),
              label: t('notifications')),
          NavigationDestination(
              icon: const Icon(Icons.settings), label: t('settings')),
        ],
      ),
    );
  }
}