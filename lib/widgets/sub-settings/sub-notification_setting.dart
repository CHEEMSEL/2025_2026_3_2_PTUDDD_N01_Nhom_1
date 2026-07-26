import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class SubNotificationSetting extends StatefulWidget {
  const SubNotificationSetting({super.key});

  @override
  State<SubNotificationSetting> createState() => _SubNotificationSettingState();
}

class _SubNotificationSettingState extends State<SubNotificationSetting> {
  bool _pushEnabled = true;
  bool _emailEnabled = false;
  bool _smsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.orange,
          child: Icon(Icons.notifications, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 16),
        Text(
          AppTranslations.tr(context, 'notification'),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Card(
          child: Column(
            children: [
              SwitchListTile(
                title: Text(AppTranslations.tr(context, 'push_notification')),
                subtitle: Text(AppTranslations.tr(context, 'push_notification_desc')),
                value: _pushEnabled,
                onChanged: (val) => setState(() => _pushEnabled = val),
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: Text(AppTranslations.tr(context, 'email_notification')),
                subtitle: Text(AppTranslations.tr(context, 'email_notification_desc')),
                value: _emailEnabled,
                onChanged: (val) => setState(() => _emailEnabled = val),
              ),
              const Divider(height: 1),
              SwitchListTile(
                title: Text(AppTranslations.tr(context, 'sms_notification')),
                subtitle: Text(AppTranslations.tr(context, 'sms_notification_desc')),
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
