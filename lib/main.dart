import 'package:app/data/repositories/account_repository.dart';
import 'package:app/data/repositories/chat_repository.dart';
import 'package:app/logic/auth/auth_cubit.dart';
import 'package:app/logic/chat/chat_cubit.dart';
import 'package:app/logic/settings/language_provider.dart';
import 'package:app/logic/settings/theme_provider.dart';
import 'package:app/shared/constants/app_colors.dart';
import 'package:app/ui/views/auth/login_view.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageProvider = await LanguageProvider.load();
  final themeProvider = await ThemeProvider.load();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => languageProvider),
        ChangeNotifierProvider(create: (_) => themeProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(AccountRepository())),
        BlocProvider(create: (_) => ChatCubit(ChatRepository())),
      ],
      child: DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          final lightScheme =
              lightDynamic?.harmonized() ??
              ColorScheme.fromSeed(seedColor: AppColors.seed);
          final darkScheme =
              darkDynamic?.harmonized() ??
              ColorScheme.fromSeed(
                seedColor: AppColors.seed,
                brightness: Brightness.dark,
              );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: langProvider.currentLocale,
            theme: ThemeData(useMaterial3: true, colorScheme: lightScheme),
            darkTheme: ThemeData(useMaterial3: true, colorScheme: darkScheme),
            themeMode: themeProvider.themeMode,
            home: const LoginView(),
          );
        },
      ),
    );
  }
}
