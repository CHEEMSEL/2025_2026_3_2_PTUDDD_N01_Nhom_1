import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

/// Logic xử lý đăng nhập / đăng ký.
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  /// Đăng nhập với email và mật khẩu (demo, không có backend thật).
  Future<void> login({required String email, required String password}) async {
    emit(const AuthState(status: AuthStatus.loading));
    await Future<void>.delayed(const Duration(milliseconds: 500));
    emit(const AuthState(status: AuthStatus.authenticated));
  }

  /// Tạo tài khoản mới (demo).
  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    emit(const AuthState(status: AuthStatus.loading));
    await Future<void>.delayed(const Duration(milliseconds: 500));
    emit(const AuthState(status: AuthStatus.authenticated));
  }
}
