import 'package:flutter/material.dart';
import '../../../data/models/notification_model.dart';
import '../../../shared/localization/language_dict.dart';

/// Màn hình chi tiết một thông báo.
class NotifDetailView extends StatelessWidget {
  final NotificationItemModel? item;

  const NotifDetailView({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    final scheme = Theme.of(context).colorScheme;
    final notification = item;

    return Scaffold(
      appBar: AppBar(title: Text(t('notifications'))),
      body: notification == null
          ? Center(child: Text(t('no_notifications')))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: scheme.primaryContainer,
                        child: Text(
                          notification.avatar,
                          style: TextStyle(
                            fontSize: 22,
                            color: scheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              notification.time,
                              style: TextStyle(color: scheme.outline),
                            ),
                          ],
                        ),
                      ),
                      if (!notification.isRead)
                        Icon(Icons.circle, color: scheme.primary, size: 12),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: scheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t('notification'),
                          style: TextStyle(
                            color: scheme.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          notification.subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(height: 1.5),
                        ),
                        if (notification.type == 'friend_request') ...[
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {},
                                  child: const Text('Chấp nhận'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: FilledButton.tonal(
                                  onPressed: () {},
                                  child: const Text('Từ chối'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
