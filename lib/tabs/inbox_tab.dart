import 'package:flutter/material.dart';
import 'package:app/screens/in_chat_screen.dart';
import 'package:app/langs/language_dict.dart';

class InboxTab extends StatelessWidget {
  const InboxTab({super.key});

  static const _inbox = [
    {"user": "Quang Anh", "message": "Message 1", "state": "Unread"},
    {"user": "Nope", "message": "Message 2", "state": "Read"},
    {"user": "TKT", "message": "Message 3", "state": "Sending"},
    {"user": "Ramdom user", "message": "Message 4", "state": "Unread"},
    {"user": "Test", "message": "Message 5", "state": "Read"},
    {"user": "Test2", "message": "Message 5", "state": "Read"},
    {"user": "Test3", "message": "Message 5", "state": "Read"},
    {"user": "Test4", "message": "Message 5", "state": "Unread"},
    {"user": "Test5", "message": "Message 5", "state": "Read"},
    {"user": "Test6", "message": "Message 5", "state": "Sending"},
    {"user": "Test7", "message": "Message 5", "state": "Sending"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.tr(context, 'inbox')),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.view_headline_rounded), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 0),
        child: ListView.builder(
          itemCount: _inbox.length,
          itemBuilder: (context, index) => _InboxTile(item: _inbox[index]),
        ),
      ),
    );
  }
}

class _InboxTile extends StatelessWidget {
  final Map<String, String> item;

  const _InboxTile({required this.item});

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
              "Unread" => Icon(Icons.circle,
                  color: scheme.primary, size: 15),
              "Read" => Icon(Icons.task_alt,
                  color: scheme.outline, size: 15),
              "Sending" => Icon(Icons.timer,
                  color: scheme.tertiary, size: 15),
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