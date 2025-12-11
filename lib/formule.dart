import 'package:flutter/material.dart';
import 'package:hajj_visa/TableInformation.dart';
import 'package:provider/provider.dart'; // Nécessaire pour LanguageNotifier
import 'package:hajj_visa/Translator.dart';
import 'package:hajj_visa/fivthtab.dart';
import 'package:hajj_visa/fourthtab.dart';
import 'package:hajj_visa/tabone.dart';
import 'package:hajj_visa/tabtwo.dart';
import 'package:hajj_visa/thirdtab.dart';
import 'main.dart';

class formule extends StatelessWidget {
  const formule({super.key});

  @override
  Widget build(BuildContext context) {
    final languageNotifier = Provider.of<LanguageNotifier>(context);
    final textDirection = languageNotifier.locale.languageCode == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6, // Nombre d'onglets
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: const Color(0xFF053D20), // Couleur verte
            flexibleSpace: Directionality(
              textDirection: textDirection,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo ou image
                  const Padding(
                    padding: EdgeInsets.all(8),
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

                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
          body: Directionality(
            textDirection: textDirection,
            child: Column(
              children: [
                const SizedBox(height: 10),

                // TabBar
                Material(
                  color: Colors.white,
                  child: TabBar(
                    unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.normal),
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    labelColor: const Color(0xFF053D20),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: const Color(0xFF053D20),
                    tabs: [
                      Tab(
                        text: Translator.translate('المعلومات الشخصية',
                            languageNotifier.locale.languageCode),
                      ),
                      Tab(
                        text: Translator.translate(
                            'المؤهلات', languageNotifier.locale.languageCode),
                      ),
                      Tab(
                        text: Translator.translate(
                            'حول السفر', languageNotifier.locale.languageCode),
                      ),
                      Tab(
                        text: Translator.translate('الإقامة و الدفع',
                            languageNotifier.locale.languageCode),
                      ),
                      Tab(
                        text: Translator.translate(
                            'الجدول', languageNotifier.locale.languageCode),
                      ),
                      Tab(
                        text: Translator.translate(
                            'المستندات', languageNotifier.locale.languageCode),
                      ),
                    ],
                  ),
                ),

                // Contenu des onglets
                const Expanded(
                  child: TabBarView(
                    children: [
                      tabone(),
                      tabtwo(),
                      thirdtab(),
                      fourthtab(),
                      Tableinf(),
                      Fivthtab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
