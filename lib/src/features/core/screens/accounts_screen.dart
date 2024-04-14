// write_screen.dart

import 'package:email_ai/src/constants/colors.dart';
import 'package:email_ai/src/features/core/screens/appLanguage_modelSheet.dart';
import 'package:email_ai/src/features/core/screens/theme_modelSheet.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../main.dart';

class AccountScreen extends StatelessWidget {
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
            languageModelSheet(context);
          },
          child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
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
          child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
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
          child: Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
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

// Do similar stubs for PromptsScreen, EmailsScreen, and AccountScreen.
