import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hajj_visa/Translator.dart';
// import 'package:hajj_visa/fourthtab.dart';
import 'package:provider/provider.dart'; // Pour LanguageNotifier
import 'main.dart';

class fourthtab extends StatefulWidget {
  const fourthtab({super.key});

  @override
  State<fourthtab> createState() => _thirdtabState();
}

class _thirdtabState extends State<fourthtab> {
  String? _paymentMethod = ''; // Variable pour suivre la méthode de paiement

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
                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'مدة الإقامة بالمملكة',
                    languageNotifier: languageNotifier,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return Translator.translate(
                          'الحقل فارغ', languageNotifier.locale.languageCode);
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'جهة الوصول بالمملكة',
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
                    labelText: 'اسم الشركة الناقلة ',
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
                _builddateoftraveling(languageNotifier),
                _builddateoftraveling2(languageNotifier),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Translator.translate(
                          'طريقة الدفع', languageNotifier.locale.languageCode),
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF053D20)),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            activeColor: const Color(0xFF053D20),
                            title: Text(Translator.translate(
                                'نقدا', languageNotifier.locale.languageCode)),
                            value: 'نقدا',
                            groupValue: _paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            activeColor: const Color(0xFF053D20),
                            title: Text(Translator.translate('مجاملة',
                                languageNotifier.locale.languageCode)),
                            value: 'مجاملة',
                            groupValue: _paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            activeColor: const Color(0xFF053D20),
                            title: Text(Translator.translate(
                                'إيصال', languageNotifier.locale.languageCode)),
                            value: 'إيصال',
                            groupValue: _paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            activeColor: const Color(0xFF053D20),
                            title: Text(Translator.translate(
                                'شيك', languageNotifier.locale.languageCode)),
                            value: 'شيك',
                            groupValue: _paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _paymentMethod = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

// Title for the gender selection

// Display "اسم المحرم و صلته" if the selected sex is Female
                if (_paymentMethod == 'شيك') ...[
                  TextFormField(
                    onSaved: (val) {},
                    decoration: _buildInputDecoration(
                      labelText: 'رقم الشيك',
                      languageNotifier: languageNotifier,
                    ),
                    keyboardType:
                        TextInputType.number, // Affiche le clavier numérique
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Accepte uniquement les chiffres
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Translator.translate(
                            'الحقل فارغ', languageNotifier.locale.languageCode);
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'يجب إدخال أرقام فقط';
                      }
                      return null;
                    },
                  ),
                  _buildcheque(languageNotifier),
                ],
                if (_paymentMethod == 'إيصال') ...[
                  TextFormField(
                    onSaved: (val) {},
                    decoration: _buildInputDecoration(
                      labelText: 'رقم إيصال',
                      languageNotifier: languageNotifier,
                    ),
                    keyboardType:
                        TextInputType.number, // Affiche le clavier numérique
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Accepte uniquement les chiffres
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return Translator.translate(
                            'الحقل فارغ', languageNotifier.locale.languageCode);
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'يجب إدخال أرقام فقط';
                      }
                      return null;
                    },
                  ),
                  _buildcheque2(languageNotifier),
                ],
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
                        DefaultTabController.of(context).animateTo(2);
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
                              4); // Passer à l'onglet suivant (index 1)
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

  Widget _builddateoftraveling(LanguageNotifier languageNotifier) {
    TextEditingController dateController = TextEditingController();

    return TextFormField(
      controller: dateController,
      readOnly: true, // Prevents user from typing manually
      decoration: _buildInputDecoration(
              labelText: 'تاريخ المغادرة', languageNotifier: languageNotifier)
          .copyWith(
        suffixIcon: const Icon(Icons.calendar_today, color: Color(0xFF053D20)),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          String formattedDate =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          dateController.text = formattedDate;
        }
      },
      onSaved: (val) {
        print("Date  : $val");
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Translator.translate('يرجى اختيار تاريخ المغادرة ',
              languageNotifier.locale.languageCode);
        }
        return null;
      },
    );
  }

  Widget _builddateoftraveling2(LanguageNotifier languageNotifier) {
    TextEditingController dateController = TextEditingController();

    return TextFormField(
      controller: dateController,
      readOnly: true, // Prevents user from typing manually
      decoration: _buildInputDecoration(
              labelText: 'تاريخ الوصول', languageNotifier: languageNotifier)
          .copyWith(
        suffixIcon: const Icon(Icons.calendar_today, color: Color(0xFF053D20)),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          String formattedDate =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          dateController.text = formattedDate;
        }
      },
      onSaved: (val) {
        print("Date  : $val");
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Translator.translate('يرجى اختيار تاريخ الوصول ',
              languageNotifier.locale.languageCode);
        }
        return null;
      },
    );
  }

  Widget _buildcheque(LanguageNotifier languageNotifier) {
    TextEditingController dateController = TextEditingController();

    return TextFormField(
      controller: dateController,
      readOnly: true, // Prevents user from typing manually
      decoration: _buildInputDecoration(
              labelText: ' تاريخ الشيك  ', languageNotifier: languageNotifier)
          .copyWith(
        suffixIcon: const Icon(Icons.calendar_today, color: Color(0xFF053D20)),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          String formattedDate =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          dateController.text = formattedDate;
        }
      },
      onSaved: (val) {
        print("Date  : $val");
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Translator.translate('يرجى اختيار  تاريخ الشيك ',
              languageNotifier.locale.languageCode);
        }
        return null;
      },
    );
  }

  Widget _buildcheque2(LanguageNotifier languageNotifier) {
    TextEditingController dateController = TextEditingController();

    return TextFormField(
      controller: dateController,
      readOnly: true, // Prevents user from typing manually
      decoration: _buildInputDecoration(
              labelText: ' تاريخ إيصال  ', languageNotifier: languageNotifier)
          .copyWith(
        suffixIcon: const Icon(Icons.calendar_today, color: Color(0xFF053D20)),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (pickedDate != null) {
          String formattedDate =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          dateController.text = formattedDate;
        }
      },
      onSaved: (val) {
        print("Date  : $val");
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Translator.translate(
              'يرجى اختيار تاريخ إيصال ', languageNotifier.locale.languageCode);
        }
        return null;
      },
    );
  }
}
