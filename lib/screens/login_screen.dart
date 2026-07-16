import 'package:flutter/material.dart';

class LoginScreen
    extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login')),
      body: Center(
        child: LayoutBuilder(
          builder:
              (context, constraints) {
            double boxWidth =
                constraints.maxWidth >
                        500
                    ? 400
                    : constraints
                            .maxWidth *
                        0.85;
            return SizedBox(
              width: boxWidth,
              child: const Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  TextField(
                    decoration:
                        InputDecoration(
                      labelText:
                          "Account",
                      hintText:
                          "Input Account Here",
                      border:
                          OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration:
                        InputDecoration(
                      labelText:
                          "Password",
                      hintText:
                          "Input Password Here",
                      border:
                          OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
