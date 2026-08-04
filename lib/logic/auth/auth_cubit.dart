import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/account_model.dart';
import '../../data/repositories/account_repository.dart';
import 'auth_state.dart';

/// Logic xử lý đăng nhập / đăng ký dựa trên tài khoản lưu dạng XML.
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repository) : super(const AuthState.initial());

  final AccountRepository _repository;

  /// Đăng nhập bằng tên đăng nhập và mật khẩu.
  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    final account = await _repository.login(
      username.trim(),
      password.trim(),
    );
    if (account == null) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: 'auth_error'));
      return;
    }
    emit(
      state.copyWith(
        status: AuthStatus.authenticated,
        currentUser: account,
      ),
    );
  }

  /// Tạo tài khoản mới và tự đăng nhập.
  Future<void> createAccount({
    required String username,
    required String password,
    required String fullName,
    String? email,
    String? phone,
    String? birthday,
    String? gender,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    final existed = await _repository.isUsernameTaken(username.trim());
    if (existed) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: 'username_taken'));
      return;
    }

    final account = AccountModel(
      username: username.trim(),
      password: password.trim(),
      fullName: fullName.trim(),
      email: email?.trim() ?? '',
      phone: phone?.trim() ?? '',
      birthday: birthday?.trim() ?? '',
      gender: gender?.trim() ?? '',
    );
    await _repository.register(account);
    emit(
      state.copyWith(
        status: AuthStatus.authenticated,
        currentUser: account,
      ),
    );
  }

  /// Đăng xuất, đưa về trạng thái ban đầu.
  void logout() {
    emit(const AuthState.initial());
  }

  /// Lưu lại thông tin tài khoản khi người dùng chỉnh sửa trong Cài đặt.
  Future<void> updateProfile(AccountModel updated) async {
    await _repository.updateProfile(updated);
    emit(state.copyWith(currentUser: updated));
  }
}