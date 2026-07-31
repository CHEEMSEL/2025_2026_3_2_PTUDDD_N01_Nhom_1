import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'langs/language_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageProvider = await LanguageProvider.load();

  runApp(
    ChangeNotifierProvider(
      create: (_) => languageProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: langProvider.currentLocale,
      home: const LoginScreen(),
    );
  }
}
