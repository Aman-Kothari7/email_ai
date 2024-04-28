import 'dart:io';

import 'package:email_ai/src/features/core/screens/main_screen.dart';
import 'package:email_ai/src/features/core/screens/onbording_screen.dart';
import 'package:email_ai/src/language_data/localString.dart';
import 'package:email_ai/src/theme/custom_theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCXW_32XyfBLIO7y8JTMMEZsf_gEGf2L3M",
        appId: "1:590100495212:android:b0138e16de28ee47af5149",
        messagingSenderId: "590100495212",
        projectId: "emailai-9f0ff",
      ),
    );
  }
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
      home: OnboardingScreen(),
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
