import 'package:flutter/material.dart';

class languagenotifier extends ChangeNotifier {
  Locale _locale = const Locale('ar'); // Default language: Arabic

  Locale get locale => _locale;

  void changeLanguage(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      notifyListeners(); // Notify all listeners about the change
    }
  }
}
