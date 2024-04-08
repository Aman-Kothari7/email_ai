import 'package:email_ai/src/features/core/screens/main_screen.dart';
import 'package:email_ai/src/language_data/localString.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: getLanguage(),
      home: MainScreen(),
    );
  }

  Locale getLanguage() {
    var language = box.read('languageCode');
    return Locale(language ?? 'en');
  }
}
