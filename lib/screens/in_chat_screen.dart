import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class InChatScreen extends StatelessWidget {
  final String username;

  const InChatScreen({super.key, this.username = "No one"});

  static const _currentUserId = "my_ID";
  static const _statuses = ["Online", "Offline", "Typing..."];
  static const _messages = [
    {"senderId": "user_01", "text": "Message 1", "time": "10:30 AM"},
    {"senderId": "my_ID", "text": "Message 2", "time": "10:31 AM"},
    {"senderId": "user_01", "text": "Test Message 3", "time": "10:32 AM"},
    {"senderId": "my_ID", "text": "Ahawdwadawdwad", "time": "10:33 AM"},
    {
      "senderId": "user_01",
      "text": "👍👍👍👍👍👍👍👍👍",
      "time": "10:35 AM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: scheme.secondaryContainer,
              child: Text(
                username.isNotEmpty ? username[0].toUpperCase() : "?",
                style: TextStyle(color: scheme.onSecondaryContainer),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username),
                Text(
                  _statuses[2],
                  style: TextStyle(
                    fontSize: 14,
                    color: scheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _MessageBubble(
                message: _messages[index],
                isMe: _messages[index]['senderId'] == _currentUserId,
              ),
            ),
          ),
          const _ChatInput(),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final Map<String, dynamic> message;
  final bool isMe;

  const _MessageBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
            color: isMe
                ? scheme.primary
                : scheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message['text'],
                style: TextStyle(
                  color: isMe ? scheme.onPrimary : scheme.onSurface,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message['time'],
                style: TextStyle(
                  color: isMe
                      ? scheme.onPrimary.withValues(alpha: 0.7)
                      : scheme.onSurface.withValues(alpha: 0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatInput extends StatelessWidget {
  const _ChatInput();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: scheme.surface,
        border: Border(
          top: BorderSide(color: scheme.outlineVariant, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add, color: scheme.primary),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: AppTranslations.tr(context, 'enter_message'),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          CircleAvatar(
            backgroundColor: scheme.primary,
            child: IconButton(
              icon: Icon(Icons.send, color: scheme.onPrimary, size: 20),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}