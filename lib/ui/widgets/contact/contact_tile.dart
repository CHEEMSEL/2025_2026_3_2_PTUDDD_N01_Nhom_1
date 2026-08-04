import 'package:flutter/material.dart';
import '../../../data/models/user_model.dart';
import '../custom_avatar.dart';

/// Một hàng liên hệ trong danh sách bạn bè.
class ContactTile extends StatelessWidget {
  final UserModel contact;

  const ContactTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: CustomAvatar(name: contact.name, radius: 22, showOnlineDot: contact.isOnline),
      title: Text(
        contact.name,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(
          color: contact.isOnline ? scheme.tertiary : scheme.outline,
          fontSize: 12,
        ),
      ),
      onTap: () {},
    );
  }
}

/// Một hàng hành động nổi bật (tạo nhóm, mời bạn).
class ContactActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isTertiary;

  const ContactActionTile({
    super.key,
    required this.icon,
    required this.title,
    this.isTertiary = false,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final bg = isTertiary ? scheme.tertiaryContainer : scheme.primaryContainer;
    final fg =
        isTertiary ? scheme.onTertiaryContainer : scheme.onPrimaryContainer;
    return ListTile(
      leading: CircleAvatar(backgroundColor: bg, child: Icon(icon, color: fg)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      onTap: () {},
    );
  }
}