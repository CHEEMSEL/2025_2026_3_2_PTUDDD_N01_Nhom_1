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
      bottomNavigationBar: NavigationBar(
        selectedIndex: slectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            slectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.message),
            label: AppTranslations.tr(context, 'messages'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.person_pin),
            label: AppTranslations.tr(context, 'contact'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.notifications),
            label: AppTranslations.tr(context, 'notifications'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: AppTranslations.tr(context, 'settings'),
          ),
        ],
      ),
    );
  }
}
