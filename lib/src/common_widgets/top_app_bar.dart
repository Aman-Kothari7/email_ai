import 'package:email_ai/src/features/core/controllers/upgrade_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  TopAppBar({Key? key}) : super(key: key);

  final UpgradeButtonController upgradeButtonController = Get.put(UpgradeButtonController()); // Get the controller

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Email AI', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
      actions: [
        Obx(
          () => upgradeButtonController.hasUpgraded.value
              ? SizedBox() // Empty box to keep space if needed
              : ElevatedButton(
                  onPressed: () {
                    //Call upgrade bottom sheet with pricing
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, // Background color
                    textStyle: TextStyle(
                      color: Colors.black,
                    ), // Text color
                  ),
                  child: Text('Upgrade'.tr),
                ),
        ),
      ],
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
