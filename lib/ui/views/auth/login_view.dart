import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/auth/auth_cubit.dart';
import '../../../logic/auth/auth_state.dart';
import '../../../shared/localization/language_dict.dart';
import '../home/main_view.dart';
import '../../widgets/auth_page.dart';
import 'create_account_view.dart';

/// Màn hình Đăng nhập.
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    context.read<AuthCubit>().login(
          username: _usernameController.text,
          password: _passwordController.text,
        );
  }

  void _openCreateAccount() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateAccountView()),
    );
  }

  void _onAuthChanged(BuildContext context, AuthState state) {
    if (state.status == AuthStatus.authenticated) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (_, __, ___) => const MainView(),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    } else if (state.status == AuthStatus.error) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(AppTranslations.tr(context, 'auth_error'))),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return BlocListener<AuthCubit, AuthState>(
      listener: _onAuthChanged,
      child: AuthPage(
        title: t('login'),
        children: [
          AuthField(
            label: t('username'),
            hint: t('input_username'),
            controller: _usernameController,
          ),
          const SizedBox(height: 20),
          AuthField(
            label: t('password'),
            hint: t('input_password'),
            obscure: true,
            controller: _passwordController,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final loading = state.status == AuthStatus.loading;
                    return FilledButton(
                      onPressed: loading ? null : _login,
                      child: Text(t('login')),
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: FilledButton.tonal(
                  onPressed: _openCreateAccount,
                  child: Text(t('create_account')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}