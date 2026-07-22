import "package:flutter/material.dart";
import 'package:app/screens/in_chat_screen.dart';

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
        backgroundColor: Colors.grey[500],
        title: const Row(
          children: [
            Icon(Icons.message),
            SizedBox(width: 10),
            Text("Inbox"),
          ],
        ),
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
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: inbox[index]["state"] == "Unread"
                  ? Colors.blue
                  : Colors.grey[400],
              child: Text(
                inbox[index]["user"]![0],
                style: const TextStyle(color: Colors.black),
              ),
            ),
            title: Text(
              inbox[index]["user"]!,
              style: TextStyle(
                color: inbox[index]["state"] == "Unread"
                    ? Colors.black
                    : Colors.grey[400],
                fontWeight: inbox[index]["state"] == "Unread"
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ),
            subtitle: Text(
              inbox[index]["message"]!,
              style: TextStyle(
                color: inbox[index]["state"] == "Unread"
                    ? Colors.black
                    : Colors.grey[400],
                fontWeight: inbox[index]["state"] == "Unread"
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
            ),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(TimeOfDay.now().format(context)),
                const SizedBox(height: 7),
                switch (inbox[index]["state"]) {
                  "Unread" => const Icon(
                      Icons.circle,
                      color: Colors.blue,
                      size: 15,
                    ),
                  "Read" => const Icon(
                      Icons.task_alt,
                      color: Colors.grey,
                      size: 15,
                    ),
                  "Sending" => const Icon(
                      Icons.timer,
                      color: Colors.orange,
                      size: 15,
                    ),
                  _ => const SizedBox.shrink(),
                },
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InChatScreen(
                    username: inbox[index]["user"]!,
                  ),
                ),
              );
            },
            onLongPress: () {
              // Handle long press on the list tile
            },
          ),
        );
      },
    );
  }
}
