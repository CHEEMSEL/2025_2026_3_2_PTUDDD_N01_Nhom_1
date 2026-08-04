import 'package:flutter/material.dart';
import '../../../shared/localization/language_dict.dart';

/// Màn hình chi tiết một thông báo.
class NotifDetailView extends StatelessWidget {
  const NotifDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.tr(context, 'notifications')),
      ),
      body: Center(
        child: Text(AppTranslations.tr(context, 'no_notifications')),
      ),
    );
  }
}