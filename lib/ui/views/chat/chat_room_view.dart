import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/chat/chat_cubit.dart';
import '../../../logic/chat/chat_state.dart';
import '../../../shared/constants/app_strings.dart';
import '../../widgets/chat/chat_input.dart';
import '../../widgets/chat/message_bubble.dart';
import '../../widgets/custom_avatar.dart';
import 'chat_info_view.dart';

/// Màn hình khung chat chi tiết.
class ChatRoomView extends StatefulWidget {
  final String roomId;
  final String username;

  const ChatRoomView({
    super.key,
    this.roomId = '',
    this.username = 'No one',
  });

  @override
  State<ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<ChatRoomView> {
  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().loadMessages(widget.roomId);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CustomAvatar(name: widget.username),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.username),
                    Text(
                      AppStrings.statusTyping,
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
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatInfoView(
                      roomId: widget.roomId,
                      username: widget.username,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: state.messages.isEmpty
                    ? const SizedBox.shrink()
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final message = state.messages[index];
                          return MessageBubble(
                            message: message,
                            isMe: message.senderId == AppStrings.currentUserId,
                          );
                        },
                      ),
              ),
              const ChatInput(),
            ],
          ),
        );
      },
    );
  }
}
