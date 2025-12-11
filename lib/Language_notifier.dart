import 'package:flutter/material.dart';

class LanguageNotifier extends ChangeNotifier {
  Locale _locale = const Locale('ar'); // Langue par défaut : Arabe

  Locale get locale => _locale;

  // Changer la langue
  void changeLanguage(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      notifyListeners();
    }
  }

  // Déterminer la direction du texte
  TextDirection get textDirection {
    return _locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
  }
}
