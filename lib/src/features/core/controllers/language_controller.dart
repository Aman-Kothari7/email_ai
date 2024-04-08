import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../models/language_model.dart';

class LanguageController extends GetxController {
  List<LanguageModel> languagesList = [];

  LanguageController() {
    languagesList.clear();
    languagesList = List.from([
      LanguageModel(
        name: 'English',
        flagProperty: FlagsCode.GB,
        code: ('en'),
        isSelected: true,
      ),
      LanguageModel(
        name: 'Spanish',
        flagProperty: FlagsCode.ES,
        code: ('sp'),
        isSelected: false,
      ),
      LanguageModel(
        name: 'French',
        flagProperty: FlagsCode.FR,
        code: ('fr'),
        isSelected: false,
      ),
    ]);
    getStoredValue();
  }

  Future<void> setUpdateLanguage(LanguageModel value) async {
    box.write('languageCode', value.code);
    box.write('language', value.name);
  }

  String getStoredValue() {
    languagesList.forEach((element) => element.isSelected = false);
    var storedValue = box.read('languageCode') ?? 'en';
    languagesList[languagesList.indexWhere((element) => element.code == storedValue)].isSelected = true;
    return storedValue;
  }

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }
}
