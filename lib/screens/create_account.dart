import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.tr(context, 'create_account')),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double boxWidth =
                constraints.maxWidth > 500 ? 400 : constraints.maxWidth * 0.85;

            return SizedBox(
              width: boxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: AppTranslations.tr(context, 'gmail'),
                      hintText: AppTranslations.tr(context, 'input_gmail'),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: AppTranslations.tr(context, 'password'),
                      hintText: AppTranslations.tr(context, 'input_password'),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Text(AppTranslations.tr(context, 'create_account'))),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
