import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class CreateAccount
    extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Create Account"),
      ),
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
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  const TextField(
                    decoration:
                        InputDecoration(
                      labelText:
                          "Gmail",
                      hintText:
                          "Input Gmail Here",
                      border:
                          OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                      height: 20),
                  const TextField(
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
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder:
                                    (context) =>
                                        const LoginScreen()));
                      },
                      child: const Text(
                          "Create Account")),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
