// write_screen.dart

import 'package:cached_network_image/cached_network_image.dart';
import 'package:email_ai/src/constants/colors.dart';
import 'package:email_ai/src/features/core/screens/appLanguage_modelSheet.dart';
import 'package:email_ai/src/features/core/screens/theme_modelSheet.dart';
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

class AccountScreen extends StatelessWidget {
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
            accountController.googleSign();
          },
          child: ContainerCard(
            child: Row(
              children: [
                Container(
                    height: 50,
                    child: ClipOval(
                      child: Obx(() => CachedNetworkImage(
                            imageUrl: accountController.profileImage.value,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => SvgPicture.asset(
                              Assets.icons.userProfile,
                            ),
                          )),
                    )),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User Profile".tr,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Obx(
                      () => (accountController.emailId.value.isNotEmpty)
                          ? Text(
                              accountController.emailId.value,
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          : SizedBox.shrink(),
                    )
                  ],
                ),
                // Spacer(),
                // Icon(Icons.chevron_right, color: AppColor.iconGreyColor)
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
