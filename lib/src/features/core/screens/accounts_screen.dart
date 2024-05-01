// write_screen.dart

import 'package:cached_network_image/cached_network_image.dart';
import 'package:email_ai/src/constants/colors.dart';
import 'package:email_ai/src/features/core/screens/appLanguage_modelSheet.dart';
import 'package:email_ai/src/features/core/screens/theme_modelSheet.dart';
import 'package:email_ai/src/features/core/screens/user_profile_screen.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../main.dart';
import '../../../common_widgets/cards.dart';
import '../controllers/account_controller.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountController accountController = AccountController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          "AI Response Settings".tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Get.to(() => UserProfileScreen())!.then((value) {
              setState(() {});
            });
          },
          child: ContainerCard(
            child: Row(
              children: [
                Container(
                    height: 50,
                    child: ClipOval(
                      child: SvgPicture.asset(
                        Assets.icons.userProfile,
                      ),
                    )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User Profile".tr,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      (box.read("userName") != null)
                          ? Text(
                              (box.read("userName") ?? '') +
                                  (box.read("userAge") != null && box.read("userAge").toString().isNotEmpty
                                      ? (", " + box.read("userAge") + " yo")
                                      : '') +
                                  (box.read("userGender") != null && box.read("userGender").toString().isNotEmpty
                                      ? (", " + box.read("userGender"))
                                      : '') +
                                  (box.read("userCompany") != null && box.read("userCompany").toString().isNotEmpty
                                      ? (", " + box.read("userCompany"))
                                      : '') +
                                  (box.read("userRole") != null && box.read("userRole").toString().isNotEmpty ? (", " + box.read("userRole")) : ''),
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: AppColor.iconGreyColor)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            languageModelSheet(context);
          },
          child: ContainerCard(
            child: Row(
              children: [
                Text(
                  "App Language".tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
                Flag.fromCode(box.read('flag') ?? FlagsCode.GB, width: 21, height: 15),
                SizedBox(
                  width: 10,
                ),
                Text(
                  (box.read('language') ?? 'English').toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Icon(Icons.chevron_right, color: AppColor.iconGreyColor)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "App Settings".tr,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            themeModelSheet(context);
          },
          child: ContainerCard(
            child: Row(
              children: [
                Text(
                  "App Theme".tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
                Icon(Icons.chevron_right, color: AppColor.iconGreyColor)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {},
          child: ContainerCard(
            child: Row(
              children: [
                Text(
                  "Rate this App".tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
                Icon(Icons.chevron_right, color: AppColor.iconGreyColor)
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        // Text(
        //   "Account".tr,
        //   style: Theme.of(context).textTheme.titleLarge,
        // ),
        // SizedBox(
        //   height: 15,
        // ),
        // GestureDetector(
        //   onTap: () {
        //     accountController.googleSign();
        //   },
        //   child: ContainerCard(
        //     child: Text(
        //       "SignIn".tr,
        //       style: Theme.of(context).textTheme.titleMedium,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  languageModelSheet(context) {
    showModalBottomSheet(
        context: context,
        //barrierColor: Colors.white.withOpacity(0),
        //backgroundColor: Theme.of(context).colorScheme.background,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(child: AppLanguageModelSheet());
        });
  }

  themeModelSheet(context) {
    showModalBottomSheet(
        context: context,
        //barrierColor: Colors.white.withOpacity(0.2),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SingleChildScrollView(child: ThemeModelSheet());
        });
  }
}
