import 'package:flutter/material.dart';
import 'package:app/logic/chat/chat_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/shared/localization/language_dict.dart';
import 'package:app/shared/constants/app_strings.dart';
import 'package:app/ui/widgets/custom_avatar.dart';

/// Trang thông tin chi tiết của một đoạn chat, lấy cảm hứng
/// từ trang "Thông tin hội thoại" của Messenger.
class ChatInfoView extends StatefulWidget {
  final String roomId;
  final String username;

  const ChatInfoView({
    super.key,
    required this.roomId,
    required this.username,
  });

  @override
  State<ChatInfoView> createState() => _ChatInfoViewState();
}

class _ChatInfoViewState extends State<ChatInfoView> {
  bool _muted = false;

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().loadMessages(widget.roomId);
  }

  void _toggleMute() {
    setState(() => _muted = !_muted);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            _muted
                ? AppTranslations.tr(context, 'muted')
                : AppTranslations.tr(context, 'unmuted'),
          ),
        ),
      );
  }

  void _confirmDelete() {
    const t = AppTranslations.tr;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(t(dialogContext, 'delete_chat')),
        content: Text(t(dialogContext, 'delete_chat_confirm')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(t(dialogContext, 'cancel')),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.pop(context);
            },
            child: Text(t(dialogContext, 'delete')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const t = AppTranslations.tr;
    String u(String key) => t(context, key);

    return Scaffold(
      appBar: AppBar(
        title: Text(u('chat_info')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Phần đầu: avatar + tên + trạng thái hoạt động.
          const SizedBox(height: 8),
          Center(
            child: CustomAvatar(name: widget.username, radius: 45),
          ),
          const SizedBox(height: 12),
          Text(
            widget.username,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            AppStrings.statusOnline,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),

          // Ô hành động: tùy chỉnh đoạn chat.
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.palette_outlined),
                  title: Text(u('customize_chat')),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Mục phương tiện và tệp.
          _sectionTitle(u('media_files')),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library_outlined),
                  title: Text(u('photos_videos')),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: const Icon(Icons.insert_drive_file_outlined),
                  title: Text(u('files')),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: const Icon(Icons.link),
                  title: Text(u('links')),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Mục quản lý đoạn chat.
          _sectionTitle(u('manage_chat')),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  secondary: Icon(
                    _muted ? Icons.notifications_off : Icons.notifications_outlined,
                  ),
                  title: Text(u('mute_notifications')),
                  value: _muted,
                  onChanged: (_) => _toggleMute(),
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: const Icon(Icons.search),
                  title: Text(u('search_in_chat')),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Mục quyền riêng tư và hỗ trợ.
          _sectionTitle(u('privacy_support')),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.block, color: scheme.error),
                  title: Text(u('block')),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Xóa đoạn chat.
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: Icon(Icons.delete_outline, color: scheme.error),
              title: Text(
                u('delete_chat'),
                style: TextStyle(color: scheme.error),
              ),
              onTap: _confirmDelete,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: textTheme.labelLarge?.copyWith(color: scheme.onSurfaceVariant),
      ),
    );
  }
}