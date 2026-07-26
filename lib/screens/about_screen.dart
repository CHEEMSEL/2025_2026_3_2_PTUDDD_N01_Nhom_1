import 'package:flutter/material.dart';
import 'package:app/langs/language_dict.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppTranslations.tr(context, 'about'))),
      body: Center(
          child: Text(AppTranslations.tr(context, 'page_content'))),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.blue.shade50,
          indicatorColor: Colors.blue.shade200,
        ),
        child: NavigationBar(
          destinations: [
            const NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home'),
            NavigationDestination(
              icon: const Icon(Icons.message),
              label: AppTranslations.tr(context, 'messages'),
            ),
            NavigationDestination(
                icon: const Icon(Icons.settings),
                label: AppTranslations.tr(context, 'settings')),
          ],
        ),
      ),
    );
  }
}
