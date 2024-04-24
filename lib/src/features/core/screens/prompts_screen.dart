// write_screen.dart

import 'package:email_ai/src/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/cards.dart';
import '../../../common_widgets/search_bar_widget.dart';
import 'common_screen.dart';

class PromptsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SearchBarWidget(),
      SizedBox(
        height: 5,
      ),
      Expanded(
        child: ListView(
          shrinkWrap: true,
          children: [
            PromptCard(
              typeContainerColor: AppColor.greenColor,
              typeContainerText: "Work",
              isBookmark: false,
              subTitleText: "Explain the issue see your mail generate right in front of you.".tr,
              titleText: "Day off Request".tr,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommonWrite(
                            isRequiredAppbar: true,
                            height: MediaQuery.of(context).size.height * 0.55,
                            maxLines: 12,
                          )),
                );
              },
            ),
            // PromptCard(
            //   typeContainerColor: AppColor.yellowColor,
            //   typeContainerText: "Fun",
            //   isBookmark: false,
            //   subTitleText: "Explain the issue see your mail generate right in front of you.".tr,
            //   titleText: "Day off Request".tr,
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => CommonWrite(
            //                 isRequiredAppbar: true,
            //                 height: MediaQuery.of(context).size.height * 0.6,
            //                 maxLines: 12,
            //               )),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    ]);
  }
}

// Do similar stubs for PromptsScreen, EmailsScreen, and AccountScreen.
