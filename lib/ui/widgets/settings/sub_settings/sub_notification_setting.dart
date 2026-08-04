import 'package:flutter/material.dart';
import 'package:app/shared/localization/language_dict.dart';
import 'package:app/ui/widgets/settings/sub_setting_header.dart';

class SubNotificationSetting extends StatefulWidget {
  const SubNotificationSetting({super.key});

  @override
  State<SubNotificationSetting> createState() =>
      _SubNotificationSettingState();
}

class _SubNotificationSettingState extends State<SubNotificationSetting> {
  bool _pushEnabled = true;
  bool _emailEnabled = false;
  bool _smsEnabled = false;

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        SubSettingHeader(icon: Icons.notifications, title: t('notification')),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              SwitchListTile(
                title: Text(t('push_notification')),
                subtitle: Text(t('push_notification_desc')),
                value: _pushEnabled,
                onChanged: (val) => setState(() => _pushEnabled = val),
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: Text(t('email_notification')),
                subtitle: Text(t('email_notification_desc')),
                value: _emailEnabled,
                onChanged: (val) => setState(() => _emailEnabled = val),
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: Text(t('sms_notification')),
                subtitle: Text(t('sms_notification_desc')),
                value: _smsEnabled,
                onChanged: (val) => setState(() => _smsEnabled = val),
              ),
            ],
          ),
        ),
      ],
    );
  }
}