import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hajj_visa/Translator.dart';
import 'package:provider/provider.dart';
// import 'package:hajj_visa/thirdtab.dart';
import 'main.dart';

class tabtwo extends StatefulWidget {
  const tabtwo({super.key});

  @override
  State<tabtwo> createState() => _tabtwoState();
}

class _tabtwoState extends State<tabtwo> {
  String? _selectedreligion = 'الإسلام';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key

  @override
  Widget build(BuildContext context) {
    final languageNotifier = Provider.of<LanguageNotifier>(context);
    final textDirection = languageNotifier.locale.languageCode == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;

    return Scaffold(
      body: Directionality(
        textDirection: textDirection,
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Form(
            key: _formKey, // Attach the form key
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              childAspectRatio: 7,
              crossAxisSpacing: 25,
              children: [
                // Full Name Field
                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'الجنسية الحالية',
                    languageNotifier: languageNotifier,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Translator.translate(
                          'الحقل فارغ', languageNotifier.locale.languageCode);
                    }
                    // Validation supplémentaire pour s'assurer que seules les lettres sont présentes
                    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')
                        .hasMatch(value)) {
                      return 'يُسمح فقط بإدخال الأحرف';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'الجنسية السابقة',
                    languageNotifier: languageNotifier,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Translator.translate(
                          'الحقل فارغ', languageNotifier.locale.languageCode);
                    }
                    // Validation supplémentaire pour s'assurer que seules les lettres sont présentes
                    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')
                        .hasMatch(value)) {
                      return 'يُسمح فقط بإدخال الأحرف';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'المهنة',
                    languageNotifier: languageNotifier,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Translator.translate(
                          'الحقل فارغ', languageNotifier.locale.languageCode);
                    }
                    // Validation supplémentaire pour s'assurer que seules les lettres sont présentes
                    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')
                        .hasMatch(value)) {
                      return 'يُسمح فقط بإدخال الأحرف';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'المؤهل العلمي',
                    languageNotifier: languageNotifier,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Translator.translate(
                          'الحقل فارغ', languageNotifier.locale.languageCode);
                    }
                    // Validation supplémentaire pour s'assurer que seules les lettres sont présentes
                    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')
                        .hasMatch(value)) {
                      return 'يُسمح فقط بإدخال الأحرف';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'مصدره',
                    languageNotifier: languageNotifier,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Translator.translate(
                          'الحقل فارغ', languageNotifier.locale.languageCode);
                    }
                    // Validation supplémentaire pour s'assurer que seules les lettres sont présentes
                    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')
                        .hasMatch(value)) {
                      return 'يُسمح فقط بإدخال الأحرف';
                    }
                    return null;
                  },
                ),

                DropdownButtonFormField<String>(
                  value: _selectedreligion,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedreligion = newValue;
                    });
                  },
                  decoration: _buildInputDecoration(
                    labelText: 'الديانة',
                    languageNotifier: languageNotifier,
                  ),
                  items: [
                    DropdownMenuItem<String>(
                      value: 'الإسلام',
                      child: Text(Translator.translate(
                          'الإسلام', languageNotifier.locale.languageCode)),
                    ),
                    DropdownMenuItem<String>(
                      value: 'المسيحية',
                      child: Text(Translator.translate(
                          'المسيحية', languageNotifier.locale.languageCode)),
                    ),
                    DropdownMenuItem<String>(
                      value: 'اليهودية',
                      child: Text(Translator.translate(
                          'اليهودية', languageNotifier.locale.languageCode)),
                    ),
                  ],
                  onSaved: (val) {
                    print("Statut marital : $val");
                  },
                ),
                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'المذهب',
                    languageNotifier: languageNotifier,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Translator.translate(
                          'الحقل فارغ', languageNotifier.locale.languageCode);
                    }
                    // Validation supplémentaire pour s'assurer que seules les lettres sont présentes
                    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$')
                        .hasMatch(value)) {
                      return 'يُسمح فقط بإدخال الأحرف';
                    }
                    return null;
                  },
                ),
                // Gender Dropdown
                Container(),

                Align(
                  alignment: Alignment.topRight, // Aligne le bouton à droite
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
                        padding: EdgeInsets.zero, // Supprime le padding interne
                      ),
                      onPressed: () {
                        _formKey.currentState!.save();
                        DefaultTabController.of(context).animateTo(0);
                      },
                      child: Text(
                        Translator.translate(
                            'السابق', languageNotifier.locale.languageCode),
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

                Align(
                  alignment: Alignment.topLeft, // Aligne le bouton à droite
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
                        padding: EdgeInsets.zero, // Supprime le padding interne
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final TabController tabController =
                              DefaultTabController.of(context);
                          tabController.animateTo(
                              2); // Passer à l'onglet suivant (index 1)
                          print("Formulaire validé !");
                        } else {
                          print("Erreur de validation !");
                        }
                      },
                      child: Text(
                        Translator.translate(
                            'التالي', languageNotifier.locale.languageCode),
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
          ),
        ),
      ),
    );
  }

  // Helper to build input decorations
  InputDecoration _buildInputDecoration(
      {required String labelText, required LanguageNotifier languageNotifier}) {
    return InputDecoration(
      labelText:
          Translator.translate(labelText, languageNotifier.locale.languageCode),
      labelStyle: const TextStyle(color: Color(0xFF053D20), fontSize: 15),
      hintText:
          Translator.translate(labelText, languageNotifier.locale.languageCode),
      hintStyle: const TextStyle(color: Color(0xFF053D20), fontSize: 15),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF053D20), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
