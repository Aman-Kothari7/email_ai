import 'package:email_ai/src/constants/colors.dart';
import 'package:email_ai/src/features/core/controllers/upgrade_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  TopAppBar({Key? key}) : super(key: key);

  final UpgradeButtonController upgradeButtonController = Get.put(UpgradeButtonController()); // Get the controller

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AppBar(
        centerTitle: false,
        title: Theme.of(context).brightness == Brightness.dark
            ? SvgPicture.asset(
                Assets.icons.darkLogo,
              )
            : SvgPicture.asset(
                Assets.icons.lightLogo,
              ),
        actions: [
          Obx(
            () => upgradeButtonController.hasUpgraded.value
                ? SizedBox() // Empty box to keep space if needed
                : Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextButton(
                      onPressed: () {
                        //Call upgrade bottom sheet with pricing
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: AppColor.darkYellowColor, // Background color
                          foregroundColor: AppColor.darkYellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          textStyle: Theme.of(context).textTheme.titleMedium),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.icnCrown,
                            color: AppColor.lightYellowColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'VIP'.tr,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
        elevation: 2,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
