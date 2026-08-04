import 'package:flutter/material.dart';

/// Khung bố cục dùng chung cho các màn hình Đăng nhập / Đăng ký.
class AuthPage extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const AuthPage({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width =
                constraints.maxWidth > 500 ? 400.0 : constraints.maxWidth * 0.85;
            return SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Ô nhập liệu dùng cho màn hình Đăng nhập / Đăng ký.
class AuthField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AuthField({
    super.key,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}