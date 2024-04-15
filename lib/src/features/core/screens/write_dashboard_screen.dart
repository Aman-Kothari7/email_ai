// write_screen.dart

import 'package:email_ai/src/constants/colors.dart';
import 'package:email_ai/src/features/core/screens/write_dashboard/grammar_screen.dart';
import 'package:email_ai/src/features/core/screens/write_dashboard/reply_screen.dart';
import 'package:email_ai/src/features/core/screens/write_dashboard/write_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            height: 50,
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              padding: EdgeInsets.zero,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(45), // Creates border
                  color: AppColor.primaryColor), //Change background color from here
              labelStyle: TextStyle(
                fontSize: 16,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: AppColor.textLightGreyColor,
              tabs: [
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Write".tr,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  //text: "Write".tr,
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Reply".tr,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  //text: "Write".tr,
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Grammar".tr,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  //text: "Write".tr,
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            children: [
              WriteScreen(),
              ReplayScreen(),
              GrammarScreen(),
            ],
          ))
        ],
      ),
    );
  }
}

// Do similar stubs for PromptsScreen, EmailsScreen, and AccountScreen.
