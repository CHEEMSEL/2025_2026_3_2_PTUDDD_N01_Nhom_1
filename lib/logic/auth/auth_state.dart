import '../../data/models/account_model.dart';

/// Trạng thái quá trình đăng nhập.
enum AuthStatus { initial, loading, authenticated, error }

/// Trạng thái của luồng xử lý đăng nhập.
class AuthState {
  final AuthStatus status;
  final AccountModel? currentUser;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.currentUser,
    this.errorMessage,
  });

  const AuthState.initial() : this();

  AuthState copyWith({
    AuthStatus? status,
    AccountModel? currentUser,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      currentUser: currentUser ?? this.currentUser,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
