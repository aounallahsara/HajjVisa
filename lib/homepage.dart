import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'package:hajj_visa/Translator.dart';
import 'package:hajj_visa/formule.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageNotifier = Provider.of<LanguageNotifier>(context);
    final textDirection = languageNotifier.locale.languageCode == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: const Color(0xFF053D20), // Couleur verte
          automaticallyImplyLeading:
              false, // Supprime le bouton de retour par défaut
          flexibleSpace: Directionality(
            textDirection: textDirection,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo ou image
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('lib/images/aaa.png'),
                    width: 90,
                    height: 90,
                  ),
                ),

                // Texte principal
                Expanded(
                  child: Text(
                    Translator.translate(
                        'سفارة المملكة العربية السعودية القسم القنصلي',
                        languageNotifier.locale.languageCode),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // Bouton d'action

                // Menu déroulant pour changer la langue
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: DropdownButton<String>(
                    value: languageNotifier.locale.languageCode,
                    icon: const Icon(Icons.language, color: Colors.white),
                    dropdownColor: const Color(0xFF053D20),
                    underline: Container(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        languageNotifier.changeLanguage(Locale(newValue));
                      }
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text('العربية',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('English',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        ),
      ),
      body: Directionality(
        textDirection:
            textDirection, // Définit la direction du texte globalement
        child: Container(
          color: const Color(0xFFF5F5DC),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    Translator.translate(
                        'مرحبًا بكم في بوابة تأشيرات السعودية - منصتكم الموثوقة لتجربة تقديم تأشيرات سهلة وفعالة',
                        languageNotifier.locale.languageCode),
                    style: const TextStyle(
                      color: Color(0xFF053D20),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const formule()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 80),
                  backgroundColor: const Color(0xFF053D20),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  Translator.translate(
                      'ابدأ الطلب', languageNotifier.locale.languageCode),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
