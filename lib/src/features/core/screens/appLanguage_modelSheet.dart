import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../controllers/language_controller.dart';

class AppLanguageModelSheet extends StatelessWidget {
  AppLanguageModelSheet({super.key});

  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "App Language".tr,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.close))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              height: 1,
              color: AppColor.greyColor,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              physics: const ClampingScrollPhysics(),
              itemCount: controller.languagesList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.languagesList.forEach((element) => element.isSelected = false);
                    controller.languagesList[index].isSelected = true;
                    controller.updateLanguage(Locale(controller.languagesList[index].code ?? 'en'));
                    controller.setUpdateLanguage(controller.languagesList[index]);
                  },
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flag.fromCode(controller.languagesList[index].flagProperty!, width: 24, height: 24),
                          SizedBox(width: 10),
                          Text(
                            controller.languagesList[index].name!,
                            style: TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          controller.languagesList[index].isSelected! ? Icon(Icons.check_circle) : Icon(Icons.circle_outlined)
                        ],
                      ),
                    ),
                  ]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 1,
                  color: AppColor.greyColor,
                );
              },
            ),
          ],
        ));
  }
}
