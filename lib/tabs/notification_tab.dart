import 'package:flutter/material.dart';
import 'package:app/screens/notif_screen.dart';
import 'package:app/langs/language_dict.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});
  final List<Map<String, dynamic>> notifications = const [
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
    return Scaffold(
        appBar: AppBar(
          title: Text(AppTranslations.tr(context, 'notifications')),
          actions: [
            IconButton(
              icon: const Icon(Icons.done_all),
              tooltip: AppTranslations.tr(context, 'mark_all_read'),
              onPressed: () {},
            ),
          ],
        ),
        body: NotificationList(notifications: notifications));
  }
}

class NotificationList extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;

  const NotificationList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final items = notifications[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Text(
              items['avatar'] as String,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          title: Text("${items['title']} - ${items['time']}",
              style:
                  TextStyle(color: items['read'] ? Colors.grey : Colors.black)),
          subtitle: Text(
            items['subtitle'],
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: items['read']
                    ? Theme.of(context).colorScheme.onSurfaceVariant
                    : Theme.of(context).colorScheme.onSurface),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: items['read']
                ? Theme.of(context).colorScheme.onSurfaceVariant
                : Theme.of(context).colorScheme.onSurface,
            size: 16,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NotifScreen()));
          },
        );
      },
    );
  }
}
