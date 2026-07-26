import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class NotifScreen extends StatelessWidget {
  const NotifScreen({super.key});

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
