import 'package:flutter/material.dart';

class AboutScreen
    extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('About')),
      body: const Center(
          child:
              Text("Nội dung trang")),
      bottomNavigationBar:
          NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor:
              Colors.blue.shade50,
          indicatorColor:
              Colors.blue.shade200,
        ),
        child: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home'),
            NavigationDestination(
              icon: Icon(Icons.message),
              label: "Message",
            ),
            NavigationDestination(
                icon: Icon(
                    Icons.settings),
                label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
