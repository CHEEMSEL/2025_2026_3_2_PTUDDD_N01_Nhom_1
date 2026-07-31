import 'package:flutter/material.dart';
import 'package:app/screens/in_chat_screen.dart';
import 'package:app/langs/language_dict.dart';

class InboxTab extends StatelessWidget {
  InboxTab({super.key});

  final List<Map<String, String>> inbox = [
    {
      "user": "Quang Anh",
      "message": "Message 1",
      "state": "Unread",
    },
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
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.view_headline_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: InboxListTile(inbox: inbox),
    );
  }
}

class InboxListTile extends StatelessWidget {
  final List<Map<String, String>> inbox;

  const InboxListTile({
    super.key,
    required this.inbox,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: inbox.length,
      itemBuilder: (context, index) {
        final item = inbox[index];
        final String user = item["user"] ?? "";
        final String message = item["message"] ?? "";
        final String state = item["state"] ?? "";
        final bool isUnread = state == "Unread";
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  isUnread ? Theme.of(context).colorScheme.primary : null,
              child: Text(
                user.isNotEmpty ? user[0] : "?",
                style: TextStyle(
                  color: isUnread
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
                title: Text(
                  user,
                  style: TextStyle(
                    color: isUnread
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.outline,
                    fontWeight: isUnread ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                subtitle: Text(
                  message,
                  style: TextStyle(
                    color: isUnread
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.outline,
                    fontWeight: isUnread ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(TimeOfDay.now().format(context)),
                const SizedBox(height: 7),
                  switch (state) {
                    "Unread" => Icon(
                        Icons.circle,
                        color: Theme.of(context).colorScheme.primary,
                        size: 15,
                      ),
                    "Read" => Icon(
                        Icons.task_alt,
                        color: Theme.of(context).colorScheme.outline,
                        size: 15,
                      ),
                    "Sending" =>
                    const Icon(Icons.timer, color: Colors.orange, size: 15),
                    _ => const SizedBox.shrink(),
                  },
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InChatScreen(
                    username: user,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
