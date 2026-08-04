import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _prefKey = 'app_language';

  Locale _currentLocale = const Locale('vi');

  LanguageProvider._(Locale locale);

  static Future<LanguageProvider> load() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString(_prefKey) ?? 'vi';
    return LanguageProvider._(Locale(langCode));
  }

  Locale get currentLocale => _currentLocale;
  String get currentLangCode => _currentLocale.languageCode;

  Future<void> changeLanguage(String langCode) async {
    if (_currentLocale.languageCode == langCode) return;

    _currentLocale = Locale(langCode);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, langCode);
  }
}
