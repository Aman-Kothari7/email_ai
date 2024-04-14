import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../../models/language_model.dart';

class LanguageThemeController extends GetxController {
  List<LanguageModel> languagesList = [];
  List<ThemeModel> themeList = [];
  LanguageThemeController() {
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
    themeList.clear();
    themeList = List.from([
      ThemeModel(
        name: 'System Default'.tr,
        value: 'system',
        isSelected: true,
      ),
      ThemeModel(
        name: 'Dark'.tr,
        value: 'dark',
        isSelected: false,
      ),
      ThemeModel(
        name: 'Light'.tr,
        value: 'light',
        isSelected: false,
      ),
    ]);
    getStoredValue();
  }

  Future<void> setUpdateLanguage(LanguageModel value) async {
    box.write('languageCode', value.code);
    box.write('language', value.name);
    box.write('flag', value.flagProperty);
  }

  Future<void> setUpdateTheme(value) async {
    box.write('theme', value);
  }

  void getStoredValue() {
    languagesList.forEach((element) => element.isSelected = false);
    var storedValue = box.read('languageCode') ?? 'en';
    languagesList[languagesList.indexWhere((element) => element.code == storedValue)].isSelected = true;

    themeList.forEach((element) => element.isSelected = false);
    var storedTheme = box.read('theme') ?? 'system';
    themeList[themeList.indexWhere((element) => element.value == storedTheme)].isSelected = true;
  }

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  updateTheme(val) {
    ThemeMode themeMode;
    if (val == "light") {
      themeMode = ThemeMode.light;
    } else if (val == "dark") {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }

    Get.changeThemeMode(themeMode);
    update();
    Get.back();
  }
}
