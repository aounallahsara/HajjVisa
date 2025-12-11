import 'package:flutter/material.dart';
import 'dart:io'; // Pour gérer les fichiers locaux sur mobile
import 'package:file_picker/file_picker.dart'; // Pour gérer la sélection de fichiers
import 'dart:typed_data'; // Pour les fichiers Web (en bytes)
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hajj_visa/homepage.dart';

import 'Translator.dart'; // Pour détecter si c'est sur Web ou Mobile
import 'package:provider/provider.dart'; // Pour LanguageNotifier
import 'main.dart';

class Fivthtab extends StatefulWidget {
  const Fivthtab({super.key});

  @override
  State<Fivthtab> createState() => _FivthtabState();
}

class _FivthtabState extends State<Fivthtab> {
  File? _selectedPhoto; // Pour stocker le fichier sélectionné photo sur mobile
  File?
      _selectedSignature; // Pour stocker le fichier sélectionné signature sur mobile
  Uint8List?
      _selectedPhotoBytes; // Pour stocker les bytes du fichier photo sur Web
  Uint8List?
      _selectedSignatureBytes; // Pour stocker les bytes du fichier signature sur Web
  String? _photoName; // Pour afficher le nom du fichier photo sélectionné
  String? _signatureName;

  // Fonction pour choisir une photo
  Future<void> _pickPhoto() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image, // Permet de sélectionner uniquement des images
    );

    if (result != null) {
      setState(() {
        _photoName = result.files.single.name;

        if (kIsWeb) {
          _selectedPhotoBytes = result.files.single.bytes;
        } else {
          _selectedPhoto = File(result.files.single.path!);
        }
      });
    }
  }

  // Fonction pour choisir une signature
  Future<void> _pickSignature() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image, // Permet de sélectionner uniquement des images
    );

    if (result != null) {
      setState(() {
        _signatureName = result.files.single.name;

        if (kIsWeb) {
          _selectedSignatureBytes = result.files.single.bytes;
        } else {
          _selectedSignature = File(result.files.single.path!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageNotifier = Provider.of<LanguageNotifier>(context);
    final textDirection = languageNotifier.locale.languageCode == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Directionality(
        textDirection: textDirection,
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Form(
            key: formKey,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 5,
              crossAxisSpacing: 25,
              children: [
                Text(
                  Translator.translate(
                      'أنا الموقع أدناه اقر بأن كل المعلومات التي ذكرتها صحيحة وسأكون ملتزماً بقوانين المملكة أثناء فترة إقامتي بها',
                      languageNotifier.locale.languageCode),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF053D20),
                  ),
                ),
                const SizedBox(height: 5),

                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'الاسم',
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _pickSignature,
                      child: Container(
                        height: 47,
                        width: 600,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _selectedSignature != null
                            ? Image.file(
                                _selectedSignature!,
                                fit: BoxFit.cover,
                              )
                            : _selectedSignatureBytes != null
                                ? Image.memory(
                                    _selectedSignatureBytes!,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Text(
                                      Translator.translate(
                                          "اضغط هنا لتحميل التوقيع",
                                          languageNotifier.locale.languageCode),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(
                                              0xFF053D20)), // Ajuste la taille du texte si nécessaire
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                      ),
                    ),
                    if (_signatureName != null)
                      Text(
                        'Signature sélectionnée : $_signatureName',
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xFF053D20)),
                      ),
                  ],
                ),
                _builddate1(languageNotifier),
                Container(),
                Text(
                  Translator.translate('للاستعمال الرسمي فقط:',
                      languageNotifier.locale.languageCode),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF053D20),
                  ),
                ),
                Container(),
                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'رقم الأمر المعتمد عليه او التأشيرة',
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

                TextFormField(
                  onSaved: (val) {},
                  decoration: _buildInputDecoration(
                    labelText: 'لزيارة - العمل لدى',
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
                    labelText: 'مدتها',
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
                    labelText: 'نوعها',
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
                    labelText: 'المبلغ المحصل',
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _pickPhoto,
                      child: Container(
                        height: 47,
                        width: 600,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _selectedPhoto != null
                            ? Image.file(
                                _selectedPhoto!,
                                fit: BoxFit.cover,
                              )
                            : _selectedPhotoBytes != null
                                ? Image.memory(
                                    _selectedPhotoBytes!,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Text(
                                      Translator.translate(
                                          "اضغط هنا لتحميل الصورة",
                                          languageNotifier.locale.languageCode),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(
                                              0xFF053D20)), // Ajuste la taille du texte si nécessaire
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                      ),
                    ),
                    if (_photoName != null)
                      Text(
                        'Photo sélectionnée : $_photoName',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                  ],
                ),

                // Section signature

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
                        formKey.currentState!.save();
                        DefaultTabController.of(context).animateTo(4);
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
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          final TabController tabController =
                              DefaultTabController.of(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homepage()));
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

  Widget _builddate1(LanguageNotifier languageNotifier) {
    TextEditingController dateController = TextEditingController();

    return TextFormField(
      controller: dateController,
      readOnly: true, // Prevents user from typing manually
      decoration: _buildInputDecoration(
              labelText: ' التاريخ', languageNotifier: languageNotifier)
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
          return Translator.translate(
              'يرجى اختيار تاريخ', languageNotifier.locale.languageCode);
        }
        return null;
      },
    );
  }
}
