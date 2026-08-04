import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/logic/auth/auth_cubit.dart';
import 'package:app/logic/auth/auth_state.dart';
import 'package:app/shared/localization/language_dict.dart';
import 'package:app/ui/widgets/settings/sub_setting_header.dart';

/// Trang chi tiết tài khoản — xem và chỉnh sửa thông tin cá nhân.
class SubAccountSetting extends StatefulWidget {
  const SubAccountSetting({super.key});

  @override
  State<SubAccountSetting> createState() => _SubAccountSettingState();
}

class _SubAccountSettingState extends State<SubAccountSetting> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _birthdayController;
  String _gender = '';

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthCubit>().state.currentUser;
    _fullNameController = TextEditingController(text: user?.fullName ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _birthdayController = TextEditingController(text: user?.birthday ?? '');
    _gender = user?.gender ?? '';
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final user = context.read<AuthCubit>().state.currentUser;
    if (user == null) return;

    context.read<AuthCubit>().updateProfile(
          user.copyWith(
            fullName: _fullNameController.text.trim(),
            email: _emailController.text.trim(),
            phone: _phoneController.text.trim(),
            birthday: _birthdayController.text.trim(),
            gender: _gender,
          ),
        );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(AppTranslations.tr(context, 'saved'))),
      );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    String t(String key) => AppTranslations.tr(context, key);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state.currentUser;
        final username = user?.username ?? '';
        final displayName = _fullNameController.text.trim().isEmpty
            ? username
            : _fullNameController.text.trim();

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SubSettingHeader(icon: Icons.person, title: displayName),
            Text(
              '@$username',
              textAlign: TextAlign.center,
              style:
                  textTheme.bodyLarge?.copyWith(color: scheme.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _field(
                    icon: Icons.badge,
                    label: t('username'),
                    enabled: false,
                    initial: username,
                  ),
                  const SizedBox(height: 12),
                  _field(
                    icon: Icons.person,
                    label: t('full_name'),
                    controller: _fullNameController,
                  ),
                  const SizedBox(height: 12),
                  _field(
                    icon: Icons.email,
                    label: t('email'),
                    controller: _emailController,
                  ),
                  const SizedBox(height: 12),
                  _field(
                    icon: Icons.phone,
                    label: t('phone'),
                    controller: _phoneController,
                  ),
                  const SizedBox(height: 12),
                  _field(
                    icon: Icons.calendar_today,
                    label: t('birthday'),
                    controller: _birthdayController,
                  ),
                  const SizedBox(height: 12),
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
                ],
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.save),
              label: Text(t('save')),
            ),
          ],
        );
      },
    );
  }

  Widget _field({
    required IconData icon,
    required String label,
    TextEditingController? controller,
    String? initial,
    String? hint,
    bool enabled = true,
  }) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      initialValue: controller == null ? initial : null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }
}