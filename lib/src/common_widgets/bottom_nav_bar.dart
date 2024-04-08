import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Write'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Prompts'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.email),
          label: 'My Emails'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Settings'.tr,
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
