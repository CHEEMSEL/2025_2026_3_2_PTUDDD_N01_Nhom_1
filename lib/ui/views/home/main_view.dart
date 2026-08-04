import 'package:flutter/material.dart';
import '../../../shared/localization/language_dict.dart';
import '../../widgets/home/floating_dock.dart';
import '../chat/chat_list_view.dart';
import '../contact/contact_view.dart';
import '../notification/notification_view.dart';
import '../settings/settings_view.dart';

/// Màn hình chính chứa các tab và thanh điều hướng nổi.
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  final _tabCache = <Widget?>[null, null, null, null];

  Widget _buildTab(int index) {
    switch (index) {
      case 0:
        return const ChatListView();
      case 1:
        return const ContactView();
      case 2:
        return const NotificationView();
      case 3:
        return const SettingsView();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    _tabCache[selectedIndex] ??= _buildTab(selectedIndex);
    final tabs = List.generate(
      4,
      (index) => _tabCache[index] ?? const SizedBox.shrink(),
    );

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(index: selectedIndex, children: tabs),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              minimum: const EdgeInsets.only(bottom: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: LayoutBuilder(
                  builder: (context, constraints) => ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth - 20),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: FloatingDock(
                        selectedIndex: selectedIndex,
                        onSelected: (index) =>
                            setState(() => selectedIndex = index),
                        items: [
                          (Icons.message, t('messages')),
                          (Icons.person_pin, t('contact')),
                          (Icons.notifications, t('notifications')),
                          (Icons.settings, t('settings')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}