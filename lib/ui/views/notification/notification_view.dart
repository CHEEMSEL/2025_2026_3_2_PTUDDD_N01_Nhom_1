import 'package:flutter/material.dart';
import '../../../data/models/notification_model.dart';
import '../../../data/repositories/chat_repository.dart';
import '../../../shared/localization/language_dict.dart';
import '../../widgets/notification/notification_tile.dart';

/// Tab Thông báo.
class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    final repository = ChatRepository();
    return FutureBuilder<List<NotificationItemModel>>(
      future: repository.getNotifications(),
      builder: (context, snapshot) {
        final items = snapshot.data ?? const <NotificationItemModel>[];
        return Scaffold(
          appBar: AppBar(
            title: Text(t('notifications')),
            actions: [
              IconButton(
                icon: const Icon(Icons.done_all),
                tooltip: t('mark_all_read'),
                onPressed: () {},
              ),
            ],
          ),
          body: SafeArea(
            top: false,
            minimum: const EdgeInsets.only(bottom: 0),
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  NotificationTile(item: items[index]),
            ),
          ),
        );
      },
    );
  }
}
