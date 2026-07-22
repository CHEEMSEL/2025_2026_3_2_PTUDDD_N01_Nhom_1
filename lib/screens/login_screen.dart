import 'package:app/screens/create_account.dart';
import 'package:app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
                  const TextField(
                    decoration: InputDecoration(
                      labelText: "Gmail",
                      hintText: "Input Gmail Here",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Input Password Here",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                            child: const Text("Login")),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateAccount()));
                              },
                              child: const Text("Create Account")))
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
