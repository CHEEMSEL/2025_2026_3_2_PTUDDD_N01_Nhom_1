import 'package:flutter/material.dart';
import '../../../data/models/chat_room_model.dart';
import '../../../shared/utils/date_formatter.dart';
import '../../views/chat/chat_room_view.dart';
import '../custom_avatar.dart';

/// Một mục (item) trong danh sách các phòng chat.
class InboxTile extends StatelessWidget {
  final ChatRoomModel room;

  const InboxTile({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final unread = room.status == MessageStatus.unread;
    final readColor = unread ? scheme.onSurface : scheme.outline;

    return ListTile(
      leading: CustomAvatar(name: room.name),
      title: Text(
        room.name,
        style: TextStyle(
          color: readColor,
          fontWeight: unread ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        room.lastMessage,
        style: TextStyle(
          color: readColor,
          fontWeight: unread ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(DateFormatter.formatTime(DateTime.now())),
          const SizedBox(height: 7),
          switch (room.status) {
            MessageStatus.unread => Icon(Icons.circle, color: scheme.primary, size: 15),
            MessageStatus.read => Icon(Icons.task_alt, color: scheme.outline, size: 15),
            MessageStatus.sending => Icon(Icons.timer, color: scheme.tertiary, size: 15),
          },
        ],
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatRoomView(
            roomId: room.id,
            username: room.name,
          ),
        ),
      ),
    );
  }
}