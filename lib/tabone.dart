import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hajj_visa/Translator.dart';
import 'package:hajj_visa/homepage.dart';
import 'package:provider/provider.dart'; // Pour LanguageNotifier
import 'main.dart';

class tabone extends StatefulWidget {
  const tabone({super.key});

  @override
  State<tabone> createState() => _taboneState();
}

class _taboneState extends State<tabone> {
  String? _selectedStatus = 'single';
  String? _selectedSex = 'male';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key

  @override
  Widget build(BuildContext context) {
    // Récupérer la langue actuelle à partir de LanguageNotifier
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
            key: _formKey, // Attacher la clé de formulaire
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              childAspectRatio: 7,
              crossAxisSpacing: 25,
              children: [
                // Full Name Field
                TextFormField(
                  onSaved: (val) {
                    String? fullName = val;
                    print("Nom complet : $fullName");
                  },
                  decoration: _buildInputDecoration(
                    labelText: 'الإسم الكامل',
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

                // Mother Name Field
                TextFormField(
                  onSaved: (val) {
                    String? motherName = val;
                    print("Nom de la mère : $motherName");
                  },
                  decoration: _buildInputDecoration(
                    labelText: 'اسم الأم',
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

                // Place of Birth Field
                TextFormField(
                  onSaved: (val) {
                    String? placeOfBirth = val;
                    print("Lieu de naissance : $placeOfBirth");
                  },
                  decoration: _buildInputDecoration(
                    labelText: 'مكان الولادة',
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

                // Marital Status Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedStatus = newValue;
                    });
                  },
                  decoration: _buildInputDecoration(
                    labelText: 'الحالة الاجتماعية',
                    languageNotifier: languageNotifier,
                  ),
                  items: [
                    DropdownMenuItem<String>(
                      value: 'single',
                      child: Text(Translator.translate(
                          'أعزب', languageNotifier.locale.languageCode)),
                    ),
                    DropdownMenuItem<String>(
                      value: 'married',
                      child: Text(Translator.translate(
                          'متزوج', languageNotifier.locale.languageCode)),
                    ),
                    DropdownMenuItem<String>(
                      value: 'divorced',
                      child: Text(Translator.translate(
                          'مطلق', languageNotifier.locale.languageCode)),
                    ),
                  ],
                  onSaved: (val) {
                    print("Statut marital : $val");
                  },
                ),

                // Gender Dropdown
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Translator.translate(
                          'الجنس', languageNotifier.locale.languageCode),
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
                                'ذكر', languageNotifier.locale.languageCode)),
                            value: 'ذكر',
                            groupValue: _selectedSex,
                            onChanged: (value) {
                              setState(() {
                                _selectedSex = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            activeColor: const Color(0xFF053D20),
                            title: Text(Translator.translate(
                                'أنثى', languageNotifier.locale.languageCode)),
                            value: 'أنثى',
                            groupValue: _selectedSex,
                            onChanged: (value) {
                              setState(() {
                                _selectedSex = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                if (_selectedSex == 'أنثى') ...[
                  TextFormField(
                    onSaved: (val) {},
                    decoration: _buildInputDecoration(
                      labelText: 'اسم المحرم',
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
                      labelText: 'صلته',
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
                ],

                // Date of Birth Field
                _buildDateOfBirthField(languageNotifier),

                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'عنوان المنزل',
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
                    labelText: 'رقم الهاتف',
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const homepage()),
                        );
                        print("Formulaire validé !");
                      },
                      child: Text(
                        Translator.translate(
                            'السابق', languageNotifier.locale.languageCode),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
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
                              1); // Passer à l'onglet suivant (index 1)
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
                            color: Colors.white),
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

  // Widget to build the Date of Birth Field
  Widget _buildDateOfBirthField(LanguageNotifier languageNotifier) {
    TextEditingController dateController = TextEditingController();

    return TextFormField(
      controller: dateController,
      readOnly: true, // Prevents user from typing manually
      decoration: _buildInputDecoration(
              labelText: 'تاريخ الميلاد', languageNotifier: languageNotifier)
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
        print("Date de naissance : $val");
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Translator.translate('يرجى اختيار تاريخ الميلاد',
              languageNotifier.locale.languageCode);
        }
        return null;
      },
    );
  }
}
