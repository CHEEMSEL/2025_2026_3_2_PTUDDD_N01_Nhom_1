/// Trạng thái quá trình đăng nhập.
enum AuthStatus { initial, loading, authenticated, error }

/// Trạng thái của luồng xử lý đăng nhập.
class AuthState {
  final AuthStatus status;
  final String? errorMessage;

  const AuthState({this.status = AuthStatus.initial, this.errorMessage});

  const AuthState.initial() : this();
}
