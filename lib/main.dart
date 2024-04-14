import 'package:email_ai/src/features/core/screens/main_screen.dart';
import 'package:email_ai/src/language_data/localString.dart';
import 'package:email_ai/src/theme/custom_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

final box = GetStorage();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Email App',
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: getLanguage(),
      home: MainScreen(),
      themeMode: getTheme(),
      theme: ThemeDataStyle.light, // Light/Default mode styles
      darkTheme: ThemeDataStyle.dark, // Dark mode styles
    );
  }

  Locale getLanguage() {
    var language = box.read('languageCode');
    return Locale(language ?? 'en');
  }

  ThemeMode getTheme() {
    var theme = box.read('theme') ?? 'system';
    if (theme == "light") {
      return ThemeMode.light;
    } else if (theme == "dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }
}
