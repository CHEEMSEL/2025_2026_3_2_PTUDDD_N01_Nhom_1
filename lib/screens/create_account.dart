import 'package:app/screens/auth_page.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/langs/language_dict.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return AuthPage(
      title: t('create_account'),
      children: [
        AuthField(label: t('gmail'), hint: t('input_gmail')),
        const SizedBox(height: 20),
        AuthField(label: t('password'), hint: t('input_password'), obscure: true),
        const SizedBox(height: 30),
        FilledButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          ),
          child: Text(t('create_account')),
        ),
      ],
    );
  }
}