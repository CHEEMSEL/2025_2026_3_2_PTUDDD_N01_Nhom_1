import 'package:flutter/material.dart';

/// Ảnh đại diện hiển thị chữ cái đầu của tên người dùng.
class CustomAvatar extends StatelessWidget {
  final String name;
  final double radius;
  final bool showOnlineDot;

  const CustomAvatar({
    super.key,
    required this.name,
    this.radius = 20,
    this.showOnlineDot = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';
    final avatar = CircleAvatar(
      radius: radius,
      backgroundColor: scheme.secondaryContainer,
      child: Text(
        initial,
        style: TextStyle(
          color: scheme.onSecondaryContainer,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    if (!showOnlineDot) return avatar;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: radius * 0.55,
            height: radius * 0.55,
            decoration: BoxDecoration(
              color: scheme.tertiary,
              shape: BoxShape.circle,
              border: Border.all(color: scheme.surface, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}