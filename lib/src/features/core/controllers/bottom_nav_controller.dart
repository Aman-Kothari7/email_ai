import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/accounts_screen.dart';
import '../screens/emails_screen.dart';
import '../screens/prompts_screen.dart';
import '../screens/write_dashboard_screen.dart';
import 'emails_screen_controller.dart';

class BottomNavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = [
    WriteDashboardScreen(),
    PromptsScreen(),
    EmailsScreen(),
    AccountScreen(),
  ];
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
    if (index == 2) {
      pages.removeAt(2);
      pages.insert(
        2,
        EmailsScreen(),
      );
    }
  }
}
