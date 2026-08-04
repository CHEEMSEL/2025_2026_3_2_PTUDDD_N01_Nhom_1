import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/auth/auth_cubit.dart';
import '../../../logic/auth/auth_state.dart';
import '../../../shared/localization/language_dict.dart';
import '../../widgets/home/floating_dock.dart';
import '../settings/settings_view.dart';

/// Tab Hồ sơ — hiển thị thông tin người dùng đang đăng nhập,
/// nút cài đặt ở góc trên phải dẫn tới màn hình Cài đặt.
class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    String t(String key) => AppTranslations.tr(context, key);

    return Scaffold(
      appBar: AppBar(
        title: Text(t('profile')),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: t('settings'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsView()),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: 0),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final user = state.currentUser;
            final username = user?.username ?? '';
            final genderValue = user?.gender ?? '';
            final displayName = (user?.fullName ?? '').isEmpty
                ? username
                : user!.fullName;

            return ListView(
              padding: const EdgeInsets.only(bottom: kDockScrollPadding),
              children: [
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: scheme.secondaryContainer,
                  child: Text(
                    displayName.isNotEmpty ? displayName[0].toUpperCase() : '?',
                    style: TextStyle(
                      color: scheme.onSecondaryContainer,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  displayName,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  '@$username',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium
                      ?.copyWith(color: scheme.onSurfaceVariant),
                ),
                const SizedBox(height: 32),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _infoTile(
                        context,
                        icon: Icons.email_outlined,
                        label: t('email'),
                        value: user?.email ?? '',
                      ),
                      const Divider(height: 1, indent: 56),
                      _infoTile(
                        context,
                        icon: Icons.phone_outlined,
                        label: t('phone'),
                        value: user?.phone ?? '',
                      ),
                      const Divider(height: 1, indent: 56),
                      _infoTile(
                        context,
                        icon: Icons.cake_outlined,
                        label: t('birthday'),
                        value: user?.birthday ?? '',
                      ),
                      const Divider(height: 1, indent: 56),
                      _infoTile(
                        context,
                        icon: Icons.person_outline,
                        label: t('gender'),
                        value: genderValue.isEmpty
                            ? ''
                            : genderValue == 'male'
                                ? t('male')
                                : t('female'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _infoTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(icon, color: scheme.onSurfaceVariant),
      title: Text(label),
      trailing: Text(
        value,
        style: TextStyle(color: scheme.onSurfaceVariant),
      ),
    );
  }
}