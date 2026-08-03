import 'package:flutter/material.dart';
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
  final _tabCache = <Widget?>[null, null, null, null];

  Widget _buildTab(int index) {
    switch (index) {
      case 0:
        return const InboxTab();
      case 1:
        return const ContactTab();
      case 2:
        return const NotificationTab();
      case 3:
        return const SettingTab();
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
                      child: _FloatingDock(
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

class _FloatingDock extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<(IconData, String)> items;

  const _FloatingDock({
    required this.selectedIndex,
    required this.onSelected,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: scheme.surfaceContainer,
      elevation: 8,
      shadowColor: scheme.shadow.withValues(alpha: 0.4),
      borderRadius: BorderRadius.circular(28),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < items.length; i++)
              _DockItem(
                selected: i == selectedIndex,
                icon: items[i].$1,
                label: items[i].$2,
                onTap: () => onSelected(i),
              ),
          ],
        ),
      ),
    );
  }
}

class _DockItem extends StatelessWidget {
  final bool selected;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DockItem({
    required this.selected,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final onColor = selected ? scheme.onSecondaryContainer : scheme.onSurfaceVariant;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? scheme.secondaryContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: onColor),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: onColor),
            ),
          ],
        ),
      ),
    );
  }
}
