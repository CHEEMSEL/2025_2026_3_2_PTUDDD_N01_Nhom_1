import 'package:flutter/material.dart';

/// Chiều cao ước tính của thanh dock (icon + nhãn + padding).
const double kDockHeight = 60;

/// Khoảng cách giữa dock và đáy màn hình.
const double kDockBottomInset = 16;

/// Khoảng trống thêm cuối danh sách để scroll được tới hết nội dung.
const double kDockScrollPadding = kDockHeight + 2 * kDockBottomInset;

/// Thanh điều hướng nổi dạng dock ở đáy màn hình.
class FloatingDock extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final List<(Widget, String)> items;

  const FloatingDock({
    super.key,
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
  final Widget icon;
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
    final onColor =
        selected ? scheme.onSecondaryContainer : scheme.onSurfaceVariant;
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
            icon,
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