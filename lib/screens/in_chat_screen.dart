import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class InChatScreen extends StatelessWidget {
  final String username;
  const InChatScreen({
    super.key,
    this.username = "No one",
  });

  final String currentUserId = "my_ID";

  final List<Map<String, dynamic>> mockMessages = const [
    {
      "senderId": "user_01",
      "text": "Message 1",
      "time": "10:30 AM",
    },
    {
      "senderId": "my_ID",
      "text": "Message 2",
      "time": "10:31 AM",
    },
    {
      "senderId": "user_01",
      "text": "Test Message 3",
      "time": "10:32 AM",
    },
    {
      "senderId": "my_ID",
      "text": "Ahawdwadawdwad",
      "time": "10:33 AM",
    },
    {
      "senderId": "user_01",
      "text": "👍👍👍👍👍👍👍👍👍",
      "time": "10:35 AM",
    },
  ];
  static List<String> state = ["Online", "Offline", "Typing..."];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            child: Text(
              username.isNotEmpty ? username[0].toUpperCase() : "?",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username),
              Text(
                state[2],
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          )
        ]),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: mockMessages.length,
            itemBuilder: (context, index) {
              final message = mockMessages[index];
              final bool isMe = message['senderId'] == currentUserId;
              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 10.0),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        decoration: BoxDecoration(
                          color: isMe
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message['text'],
                              style: TextStyle(
                                color: isMe
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.onSurface,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              message['time'],
                              style: TextStyle(
                                color: isMe
                                    ? Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withValues(alpha: 0.7)
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.6),
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ))),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
              top: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {},
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppTranslations.tr(context, 'enter_message'),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 20,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
