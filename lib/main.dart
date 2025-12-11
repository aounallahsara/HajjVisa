import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';

class LanguageNotifier extends ChangeNotifier {
  Locale _locale = const Locale('ar'); // Langue par défaut : arabe

  Locale get locale => _locale;

  void changeLanguage(Locale newLocale) {
    if (_locale != newLocale) {
      _locale = newLocale;
      notifyListeners();
    }
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageNotifier(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageNotifier>(
      builder: (context, languageNotifier, _) {
        return MaterialApp(
          locale: languageNotifier.locale,
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            // Ajoute les localisations par défaut de Flutter
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            // Si la langue n'est pas supportée, prendre la première langue supportée
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          debugShowCheckedModeBanner: false,
          home: const homepage(),
        );
      },
    );
  }
}
