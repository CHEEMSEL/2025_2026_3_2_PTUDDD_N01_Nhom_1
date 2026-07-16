import 'package:flutter/material.dart';

class InChatScreen
    extends StatelessWidget {
  const InChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('In Chat')),
      body: const Center(
          child: Text('In Chat')),
    );
  }
}
