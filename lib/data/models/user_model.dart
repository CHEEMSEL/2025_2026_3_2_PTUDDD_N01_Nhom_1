/// Người dùng trong ứng dụng (liên hệ, bạn chat).
class UserModel {
  final String id;
  final String name;
  final String status;
  final bool isOnline;

  const UserModel({
    required this.id,
    required this.name,
    required this.status,
    required this.isOnline,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String? ?? '',
      name: map['name'] as String? ?? '',
      status: map['status'] as String? ?? '',
      isOnline: map['isOnline'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'status': status,
        'isOnline': isOnline,
      };

  /// Ký tự đầu của tên dùng làm avatar khi không có ảnh.
  String get initial => name.isNotEmpty ? name[0].toUpperCase() : '?';
}
