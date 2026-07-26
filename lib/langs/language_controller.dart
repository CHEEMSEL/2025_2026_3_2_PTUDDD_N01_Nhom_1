import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('vi');

  Locale get currentLocale => _currentLocale;
  String get currentLangCode => _currentLocale.languageCode;

  void changeLanguage(String langCode) {
    if (_currentLocale.languageCode == langCode) return;

    _currentLocale = Locale(langCode);
    notifyListeners();
  }
}
