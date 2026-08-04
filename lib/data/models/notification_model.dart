/// Một thông báo trong tab Thông báo.
class NotificationItemModel {
  final String type;
  final String title;
  final String subtitle;
  final String time;
  final String avatar;
  final bool isRead;

  const NotificationItemModel({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.avatar,
    required this.isRead,
  });

  factory NotificationItemModel.fromMap(Map<String, dynamic> map) {
    return NotificationItemModel(
      type: map['type'] as String? ?? '',
      title: map['title'] as String? ?? '',
      subtitle: map['subtitle'] as String? ?? '',
      time: map['time'] as String? ?? '',
      avatar: map['avatar'] as String? ?? '?',
      isRead: map['read'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toMap() => {
        'type': type,
        'title': title,
        'subtitle': subtitle,
        'time': time,
        'avatar': avatar,
        'read': isRead,
      };
}
