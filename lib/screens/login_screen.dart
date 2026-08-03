import 'package:app/screens/auth_page.dart';
import 'package:app/screens/create_account.dart';
import 'package:app/screens/main_screen.dart';
import 'package:app/langs/language_dict.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String t(String key) => AppTranslations.tr(context, key);
    return AuthPage(
      title: t('login'),
      children: [
        AuthField(label: t('gmail'), hint: t('input_gmail')),
        const SizedBox(height: 20),
        AuthField(label: t('password'), hint: t('input_password'), obscure: true),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),
                    pageBuilder: (_, __, ___) => const MainScreen(),
                    transitionsBuilder: (_, animation, __, child) =>
                        FadeTransition(opacity: animation, child: child),
                  ),
                ),
                child: Text(t('login')),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: FilledButton.tonal(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateAccount()),
                ),
                child: Text(t('create_account')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}