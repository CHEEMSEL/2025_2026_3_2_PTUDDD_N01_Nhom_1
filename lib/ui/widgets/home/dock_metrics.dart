import 'package:flutter/material.dart';
import 'floating_dock.dart' show kDockHeight;

/// Truyền chiều cao thực tế của thanh dock xuống các tab
/// để các nút nổi (FAB) canh được đúng vị trí.
class DockMetrics extends InheritedWidget {
  final double dockHeight;

  const DockMetrics({
    super.key,
    required this.dockHeight,
    required super.child,
  });

  static double of(BuildContext context) {
    final metrics =
        context.dependOnInheritedWidgetOfExactType<DockMetrics>();
    return metrics?.dockHeight ?? kDockHeight;
  }

  @override
  bool updateShouldNotify(DockMetrics oldWidget) =>
      oldWidget.dockHeight != dockHeight;
}