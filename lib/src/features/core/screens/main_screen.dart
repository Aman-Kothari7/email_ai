// main_screen.dart

import 'package:email_ai/src/common_widgets/bottom_nav_bar.dart';
import 'package:email_ai/src/common_widgets/top_app_bar.dart';
import 'package:email_ai/src/features/core/controllers/bottom_nav_nar_controller.dart';
import 'package:email_ai/src/features/core/screens/accounts_screen.dart';
import 'package:email_ai/src/features/core/screens/emails_screen.dart';
import 'package:email_ai/src/features/core/screens/prompts_screen.dart';
import 'package:email_ai/src/features/core/screens/write_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final BottomNavigationController controller = Get.put(BottomNavigationController());

  final List<Widget> _pages = [
    WriteScreen(),
    PromptsScreen(),
    EmailsScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: _pages,
          )),
      bottomNavigationBar: Obx(() => BottomNavBar(
            selectedIndex: controller.selectedIndex.value,
            onItemSelected: (index) {
              controller.setSelectedIndex(index);
            },
          )),
    );
  }
}
