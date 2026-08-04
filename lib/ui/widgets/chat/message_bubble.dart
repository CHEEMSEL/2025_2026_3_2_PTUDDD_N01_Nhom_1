import 'package:flutter/material.dart';
import '../../../data/models/message_model.dart';

/// Bong bóng hiển thị một tin nhắn trong phòng chat.
class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;

  const MessageBubble({super.key, required this.message, required this.isMe});

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
            color: isMe ? scheme.primary : scheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: TextStyle(
                  color: isMe ? scheme.onPrimary : scheme.onSurface,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message.displayTime,
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