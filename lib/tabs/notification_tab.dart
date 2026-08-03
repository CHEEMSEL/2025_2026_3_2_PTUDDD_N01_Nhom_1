import 'package:flutter/material.dart';
import 'package:app/screens/notif_screen.dart';
import 'package:app/langs/language_dict.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  static const _notifications = [
    {
      'type': 'friend_request',
      'title': 'Nguyễn Văn A',
      'subtitle': 'Đã gửi lời mời kết bạn',
      'time': '10p trước',
      'avatar': 'A',
      'read': false,
    },
    {
      'type': 'mention',
      'title': 'Nhóm ABC ',
      'subtitle': 'Trần B đã nhắc đến bạn trong một bình luận',
      'time': '1h trước',
      'avatar': 'F',
      'read': true,
    },
    {
      'type': 'system',
      'title': 'Cảnh báo bảo mật',
      'subtitle': 'Đăng nhập mới từ thiết bị Android ở Hà Nội',
      'time': 'Hôm qua',
      'avatar': '🔒',
      'read': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return Scaffold(
      appBar: AppBar(
        title: Text(t('notifications')),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            tooltip: t('mark_all_read'),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemCount: _notifications.length,
        itemBuilder: (context, index) =>
            _NotificationTile(item: _notifications[index]),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final Map<String, dynamic> item;

  const _NotificationTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final read = item['read'] as bool;
    final textColor = read ? scheme.onSurfaceVariant : scheme.onSurface;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: scheme.primaryContainer,
        child: Text(
          item['avatar'] as String,
          style: TextStyle(color: scheme.onPrimaryContainer),
        ),
      ),
      title: Text(
        "${item['title']} - ${item['time']}",
        style: TextStyle(color: textColor),
      ),
      subtitle: Text(
        item['subtitle'],
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: textColor),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: textColor, size: 16),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotifScreen()),
      ),
    );
  }
}