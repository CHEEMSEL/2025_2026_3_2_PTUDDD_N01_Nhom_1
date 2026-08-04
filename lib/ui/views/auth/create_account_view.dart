import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/auth/auth_cubit.dart';
import '../../../logic/auth/auth_state.dart';
import '../../../shared/localization/language_dict.dart';
import '../../widgets/auth_page.dart';
import 'login_view.dart';

/// Màn hình Tạo tài khoản.
class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _createAccount() {
    context.read<AuthCubit>().createAccount(
          email: _emailController.text,
          password: _passwordController.text,
        );
  }

  void _onAuthChanged(BuildContext context, AuthState state) {
    if (state.status == AuthStatus.authenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return BlocListener<AuthCubit, AuthState>(
      listener: _onAuthChanged,
      child: AuthPage(
        title: t('create_account'),
        children: [
          AuthField(
            label: t('gmail'),
            hint: t('input_gmail'),
            controller: _emailController,
          ),
          const SizedBox(height: 20),
          AuthField(
            label: t('password'),
            hint: t('input_password'),
            obscure: true,
            controller: _passwordController,
          ),
          const SizedBox(height: 30),
          FilledButton(
            onPressed: _createAccount,
            child: Text(t('create_account')),
          ),
        ],
      ),
    );
  }
}