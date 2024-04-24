// write_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/cards.dart';
import '../../../common_widgets/search_bar_widget.dart';
import '../../../constants/colors.dart';

class EmailsScreen extends StatelessWidget {
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
            MyEmailCard(
              dateTime: DateTime.now().toString(),
              subTitleText: "Explain the issue see your mail generate right in front of you.".tr,
              titleText: "Day off Request".tr,
              onTap: () {},
            ),
          ],
        ),
      ),
    ]);
  }
}

// Do similar stubs for PromptsScreen, EmailsScreen, and AccountScreen.
