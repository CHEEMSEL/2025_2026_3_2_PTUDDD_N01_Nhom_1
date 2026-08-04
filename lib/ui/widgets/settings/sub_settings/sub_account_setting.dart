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
  DateTime? _birthday;
  String _gender = '';

  DateTime? _parseDate(String? text) {
    if (text == null || text.isEmpty) return null;
    final parts = text.split('/');
    if (parts.length != 3) return null;
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);
    if (day == null || month == null || year == null) return null;
    return DateTime(year, month, day);
  }

  String _formatDate(DateTime date) {
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    return '$d/$m/${date.year}';
  }

  Future<void> _pickBirthday() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthday ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: AppTranslations.tr(context, 'birthday'),
    );
    if (picked != null) {
      setState(() => _birthday = picked);
    }
  }

  @override
  void initState() {
    super.initState();
    final user = context.read<AuthCubit>().state.currentUser;
    _fullNameController = TextEditingController(text: user?.fullName ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _birthday = _parseDate(user?.birthday ?? '');
    _gender = user?.gender ?? '';
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
            birthday: _birthday == null ? '' : _formatDate(_birthday!),
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
                  InkWell(
                    onTap: _pickBirthday,
                    borderRadius: BorderRadius.circular(4),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      child: Text(
                        _birthday == null
                            ? t('input_birthday')
                            : _formatDate(_birthday!),
                        style: _birthday == null
                            ? TextStyle(color: Theme.of(context).hintColor)
                            : null,
                      ),
                    ),
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