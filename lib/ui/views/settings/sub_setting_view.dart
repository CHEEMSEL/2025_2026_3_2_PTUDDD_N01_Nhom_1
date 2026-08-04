import 'package:flutter/material.dart';

/// Màn hình cài đặt con — dùng chung để bọc nội dung của từng mục cài đặt.
class SubSettingView extends StatelessWidget {
  final String title;
  final Widget child;

  const SubSettingView({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: child,
    );
  }
}