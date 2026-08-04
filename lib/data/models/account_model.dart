/// Tài khoản đăng nhập của người dùng.
class AccountModel {
  final String username;
  final String password;
  final String fullName;
  final String email;
  final String phone;
  final String birthday;
  final String gender;

  const AccountModel({
    required this.username,
    required this.password,
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.birthday = '',
    this.gender = '',
  });

  AccountModel copyWith({
    String? username,
    String? password,
    String? fullName,
    String? email,
    String? phone,
    String? birthday,
    String? gender,
  }) {
    return AccountModel(
      username: username ?? this.username,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
    );
  }
}
