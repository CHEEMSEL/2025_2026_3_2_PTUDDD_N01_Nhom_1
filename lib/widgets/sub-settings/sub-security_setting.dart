import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/langs/language_controller.dart';
import 'package:app/langs/language_dict.dart';

class SubSecuritySetting extends StatefulWidget {
  const SubSecuritySetting({super.key});

  @override
  State<SubSecuritySetting> createState() => _SubSecuritySettingState();
}

class _SubSecuritySettingState extends State<SubSecuritySetting> {
  bool _biometricEnabled = false;
  bool _appLockEnabled = false;
  int _lockTimeoutMinutes = 1;

  final List<int> _timeoutOptions = [1, 5, 15, 30];

  void _showTimeoutPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AppTranslations.tr(context, 'auto_lock_time'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          ..._timeoutOptions.map(
            (minutes) => ListTile(
              title: Text(minutes < 60
                  ? "$minutes ${AppTranslations.tr(context, 'minutes')}"
                  : "${minutes ~/ 60} ${AppTranslations.tr(context, 'minutes')}"),
              trailing: _lockTimeoutMinutes == minutes
                  ? Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : null,
              onTap: () {
                setState(() => _lockTimeoutMinutes = minutes);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      children: [
        _buildCard(
          children: [
            _buildTile(
              icon: Icons.lock_outline,
              title: AppTranslations.tr(context, 'change_password'),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {
                final langCode = Provider.of<LanguageProvider>(context,
                        listen: false)
                    .currentLangCode;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(AppTranslations.getText(
                          'feature_developing', langCode))),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildCard(
          children: [
            _buildTile(
              icon: Icons.fingerprint,
              title: AppTranslations.tr(context, 'fingerprint'),
              trailing: Switch(
                value: _biometricEnabled,
                activeTrackColor: Colors.blue,
                onChanged: (v) => setState(() => _biometricEnabled = v),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _buildCard(
          children: [
            _buildTile(
              icon: Icons.lock,
              title: AppTranslations.tr(context, 'app_lock'),
              trailing: Switch(
                value: _appLockEnabled,
                activeTrackColor: Colors.blue,
                onChanged: (v) => setState(() => _appLockEnabled = v),
              ),
            ),
            if (_appLockEnabled)
              _buildTile(
                icon: Icons.timer_outlined,
                title: AppTranslations.tr(context, 'auto_lock_after'),
                subtitle: "$_lockTimeoutMinutes ${AppTranslations.tr(context, 'minutes')}",
                trailing: const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.grey),
                onTap: _showTimeoutPicker,
              ),
          ],
        ),
        const SizedBox(height: 8),
        _buildCard(
          children: [
            _buildTile(
              icon: Icons.info_outline,
              title: AppTranslations.tr(context, 'app_version'),
              subtitle: "1.0.0",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(children: children),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: Icon(icon, color: Theme.of(context).colorScheme.primary),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(color: Colors.grey))
          : null,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
