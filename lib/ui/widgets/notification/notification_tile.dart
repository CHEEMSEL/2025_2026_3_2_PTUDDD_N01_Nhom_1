import 'package:flutter/material.dart';
import '../../../data/models/notification_model.dart';
import '../../views/notification/notif_detail_view.dart';

/// Một hàng thông báo trong danh sách.
class NotificationTile extends StatelessWidget {
  final NotificationItemModel item;

  const NotificationTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textColor = item.isRead ? scheme.onSurfaceVariant : scheme.onSurface;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: scheme.primaryContainer,
        child: Text(
          item.avatar,
          style: TextStyle(color: scheme.onPrimaryContainer),
        ),
      ),
      title: Text(
        "${item.title} - ${item.time}",
        style: TextStyle(color: textColor),
      ),
      subtitle: Text(
        item.subtitle,
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: textColor),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: textColor, size: 16),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotifDetailView()),
      ),
    );
  }
}