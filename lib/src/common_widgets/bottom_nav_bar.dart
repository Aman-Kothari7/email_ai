import 'package:email_ai/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';

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
          icon: SvgPicture.asset(
            Assets.icons.icnWrite,
            colorFilter: ColorFilter.mode(selectedIndex == 0 ? AppColor.primaryColor : AppColor.iconGreyColor, BlendMode.srcIn),
          ),
          label: 'Write'.tr,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.icnPrompt,
            colorFilter: ColorFilter.mode(selectedIndex == 1 ? AppColor.primaryColor : AppColor.iconGreyColor, BlendMode.srcIn),
          ),
          label: 'Prompts'.tr,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.icnMails,
            colorFilter: ColorFilter.mode(selectedIndex == 2 ? AppColor.primaryColor : AppColor.iconGreyColor, BlendMode.srcIn),
          ),
          label: 'My Emails'.tr,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            Assets.icons.icnSettings,
            colorFilter: ColorFilter.mode(selectedIndex == 3 ? AppColor.primaryColor : AppColor.iconGreyColor, BlendMode.srcIn),
          ),
          label: 'Settings'.tr,
        ),
      ],
      selectedItemColor: AppColor.primaryColor,
      selectedIconTheme: IconThemeData(color: AppColor.primaryColor),
      unselectedIconTheme: IconThemeData(color: AppColor.iconGreyColor),
      unselectedItemColor: AppColor.iconGreyColor,
    );
  }
}
