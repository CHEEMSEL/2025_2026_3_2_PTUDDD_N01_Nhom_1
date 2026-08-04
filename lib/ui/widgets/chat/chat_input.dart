import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/chat/chat_cubit.dart';
import '../../../shared/localization/language_dict.dart';

/// Thanh nhập nội dung tin nhắn và nút gửi.
class ChatInput extends StatefulWidget {
  const ChatInput({super.key});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    context.read<ChatCubit>().sendMessage(text);
    _controller.clear();
  }

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
              controller: _controller,
              onSubmitted: (_) => _send(),
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
              onPressed: _send,
            ),
          ),
        ],
      ),
    );
  }
}