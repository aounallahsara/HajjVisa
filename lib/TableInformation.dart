import 'package:flutter/material.dart';

import 'Translator.dart';
import 'main.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart' as intl; // Ajout d'un alias pour intl

class Tableinf extends StatefulWidget {
  const Tableinf({super.key});

  @override
  State<Tableinf> createState() => TableinfState();
}

class TableinfState extends State<Tableinf> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key
  // Liste pour stocker les dépendants
  final List<Map<String, dynamic>> _dependents = [
    {'fullName': '', 'relationship': '', 'dob': '', 'sex': 'ذكر'},
  ];

  // Fonction pour ajouter un dépendant (max 5)
  void _addDependent() {
    if (_dependents.length < 5) {
      setState(() {
        _dependents.add({
          'fullName': '',
          'relationship': '',
          'dob': '',
          'sex': 'ذكر',
        });
      });
    }
  }

  // Fonction pour supprimer un dépendant
  void _removeDependent(int index) {
    if (_dependents.length > 1) {
      setState(() {
        _dependents.removeAt(index);
      });
    }
  }

  // Fonction pour sélectionner une date
  Future<void> _selectDate(BuildContext context, int index) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        _dependents[index]['dob'] =
            intl.DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final languageNotifier = Provider.of<LanguageNotifier>(context);
    final textDirection = languageNotifier.locale.languageCode == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;
    return Scaffold(
        body: Directionality(
      textDirection: textDirection,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Translator.translate(
                    "إيضاحات تخص أفراد العائلة (المعالين) على نفس جواز السفر:",
                    languageNotifier.locale.languageCode),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF053D20)),
              ),
              const SizedBox(height: 20),

              // Tableau des dépendants
              Column(
                children: [
                  for (int i = 0; i < _dependents.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: Translator.translate('الإسم الكامل',
                                    languageNotifier.locale.languageCode),
                                labelStyle: const TextStyle(
                                    color: Color(0xFF053D20), fontSize: 15),
                                hintStyle: const TextStyle(
                                    color: Color(0xFF053D20), fontSize: 15),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF053D20), width: 2),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                _dependents[i]['fullName'] = value;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: Translator.translate('الصلة',
                                    languageNotifier.locale.languageCode),
                                labelStyle: const TextStyle(
                                    color: Color(0xFF053D20), fontSize: 15),
                                hintStyle: const TextStyle(
                                    color: Color(0xFF053D20), fontSize: 15),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF053D20), width: 2),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                              onChanged: (value) {
                                _dependents[i]['relationship'] = value;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => _selectDate(context, i),
                              child: AbsorbPointer(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: Translator.translate(
                                        'تاريخ الميلاد',
                                        languageNotifier.locale.languageCode),
                                    labelStyle: const TextStyle(
                                        color: Color(0xFF053D20), fontSize: 15),
                                    hintText: _dependents[i]['dob'],
                                    suffixIcon:
                                        const Icon(Icons.calendar_today),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _dependents[i]['sex'],
                              onChanged: (String? newValue) {
                                setState(() {
                                  _dependents[i]['sex'] = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: Translator.translate(
                                    'الجنس',
                                    languageNotifier.locale
                                        .languageCode), // Traduire "الجنس"
                                labelStyle: const TextStyle(
                                    color: Color(0xFF053D20), fontSize: 15),
                                hintStyle: const TextStyle(
                                    color: Color(0xFF053D20), fontSize: 15),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF053D20), width: 2),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                              items: [
                                {
                                  'value': 'ذكر',
                                  'label': Translator.translate('ذكر',
                                      languageNotifier.locale.languageCode)
                                }, // Traduire "ذكر"
                                {
                                  'value': 'أنثى',
                                  'label': Translator.translate('أنثى',
                                      languageNotifier.locale.languageCode)
                                }, // Traduire "أنثى"
                              ].map<DropdownMenuItem<String>>(
                                  (Map<String, String> item) {
                                return DropdownMenuItem<String>(
                                  value: item['value'],
                                  child: Text(
                                      item['label']!), // Affiche la traduction
                                );
                              }).toList(),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline,
                                color: Color(0xFF053D20)),
                            onPressed: () => _removeDependent(i),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  // Bouton pour ajouter un dépendant (max 5)
                  if (_dependents.length < 5)
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        onPressed: _addDependent,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: Text(
                          style: const TextStyle(color: Colors.white),
                          Translator.translate("إضافة معال",
                              languageNotifier.locale.languageCode),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF053D20),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment:
                            Alignment.topRight, // Aligne le bouton à droite
                        child: SizedBox(
                          width: 200, // Largeur fixe
                          height: 40, // Hauteur fixe
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF053D20), // Couleur du fond
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(8), // Coins carrés
                              ),
                              padding: EdgeInsets
                                  .zero, // Supprime le padding interne
                            ),
                            onPressed: () {
                              DefaultTabController.of(context).animateTo(3);
                            },
                            child: Text(
                              Translator.translate('السابق',
                                  languageNotifier.locale.languageCode),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors
                                      .white), // Ajuste la taille du texte si nécessaire
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 850,
                      ),
                      Align(
                        alignment:
                            Alignment.topLeft, // Aligne le bouton à droite
                        child: SizedBox(
                          width: 200, // Largeur fixe
                          height: 40, // Hauteur fixe
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF053D20), // Couleur du fond
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(8), // Coins carrés
                              ),
                              padding: EdgeInsets
                                  .zero, // Supprime le padding interne
                            ),
                            onPressed: () {
                              final TabController tabController =
                                  DefaultTabController.of(context);

                              tabController.animateTo(
                                  5); // Passer à l'onglet suivant (index 1)
                            },
                            child: Text(
                              Translator.translate('التالي',
                                  languageNotifier.locale.languageCode),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors
                                      .white), // Ajuste la taille du texte si nécessaire
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
