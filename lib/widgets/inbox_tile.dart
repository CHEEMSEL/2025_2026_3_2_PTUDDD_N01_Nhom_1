import 'package:flutter/material.dart';
import 'package:app/screens/in_chat_screen.dart';

class InboxTile extends StatelessWidget {
  final Map<String, String> item;

  const InboxTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final user = item['user'] ?? "";
    final message = item['message'] ?? "";
    final state = item['state'] ?? "";
    final unread = state == "Unread";

    final readColor = unread ? scheme.onSurface : scheme.outline;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: unread ? scheme.primary : null,
          child: Text(
            user.isNotEmpty ? user[0] : "?",
            style: TextStyle(
              color: unread ? scheme.onPrimary : scheme.onSurface,
            ),
          ),
        ),
        title: Text(
          user,
          style: TextStyle(
            color: readColor,
            fontWeight: unread ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        subtitle: Text(
          message,
          style: TextStyle(
            color: readColor,
            fontWeight: unread ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(TimeOfDay.now().format(context)),
            const SizedBox(height: 7),
            switch (state) {
              "Unread" => Icon(Icons.circle, color: scheme.primary, size: 15),
              "Read" => Icon(Icons.task_alt, color: scheme.outline, size: 15),
              "Sending" => Icon(Icons.timer, color: scheme.tertiary, size: 15),
              _ => const SizedBox.shrink(),
            },
          ],
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InChatScreen(username: user),
          ),
        ),
      ),
    );
  }
}