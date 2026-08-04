import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/auth/auth_cubit.dart';
import '../../../logic/auth/auth_state.dart';
import '../../../shared/localization/language_dict.dart';
import '../home/main_view.dart';
import '../../widgets/auth_page.dart';

/// Màn hình Tạo tài khoản.
class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdayController = TextEditingController();
  String _gender = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _createAccount() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthCubit>().createAccount(
          username: _usernameController.text,
          password: _passwordController.text,
          fullName: _fullNameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
          birthday: _birthdayController.text,
          gender: _gender,
        );
  }

  void _onAuthChanged(BuildContext context, AuthState state) {
    if (state.status == AuthStatus.authenticated) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const MainView()),
        (route) => false,
      );
    } else if (state.status == AuthStatus.error) {
      final message = state.errorMessage == 'username_taken'
          ? AppTranslations.tr(context, 'username_taken')
          : AppTranslations.tr(context, 'auth_error');
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(message)));
    }
  }

  String? _validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppTranslations.tr(context, 'required_error');
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 3) {
      return AppTranslations.tr(context, 'password_too_short');
    }
    return null;
  }

  String? _validateConfirm(String? value) {
    if (value != _passwordController.text) {
      return AppTranslations.tr(context, 'password_mismatch');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return BlocListener<AuthCubit, AuthState>(
      listener: _onAuthChanged,
      child: Scaffold(
        appBar: AppBar(title: Text(t('create_account'))),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AuthField(
                      label: t('username'),
                      hint: t('input_username'),
                      controller: _usernameController,
                      validator: _validateUsername,
                    ),
                    const SizedBox(height: 16),
                    AuthField(
                      label: t('full_name'),
                      hint: t('input_full_name'),
                      controller: _fullNameController,
                    ),
                    const SizedBox(height: 16),
                    AuthField(
                      label: t('password'),
                      hint: t('input_password'),
                      obscure: true,
                      controller: _passwordController,
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 16),
                    AuthField(
                      label: t('confirm_password'),
                      hint: t('input_confirm_password'),
                      obscure: true,
                      controller: _confirmController,
                      validator: _validateConfirm,
                    ),
                    const SizedBox(height: 16),
                    AuthField(
                      label: t('email'),
                      hint: t('input_email'),
                      controller: _emailController,
                    ),
                    const SizedBox(height: 16),
                    AuthField(
                      label: t('phone'),
                      hint: t('input_phone'),
                      controller: _phoneController,
                    ),
                    const SizedBox(height: 16),
                    AuthField(
                      label: t('birthday'),
                      hint: t('input_birthday'),
                      controller: _birthdayController,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      initialValue: _gender.isEmpty ? null : _gender,
                      decoration: InputDecoration(
                        labelText: t('gender'),
                        border: const OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(value: 'male', child: Text(t('male'))),
                        DropdownMenuItem(
                            value: 'female', child: Text(t('female'))),
                      ],
                      onChanged: (value) => setState(() => _gender = value ?? ''),
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: _createAccount,
                      child: Text(t('create_account')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}