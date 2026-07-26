import 'package:app/screens/create_account.dart';
import 'package:app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppTranslations.tr(context, 'login'))),
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainScreen()));
                            },
                            child: Text(AppTranslations.tr(context, 'login'))),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateAccount()));
                              },
                              child: Text(AppTranslations.tr(context, 'create_account'))))
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
