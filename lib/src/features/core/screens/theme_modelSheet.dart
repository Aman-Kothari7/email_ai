import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constants/colors.dart';
import '../controllers/language_theme_controller.dart';

class ThemeModelSheet extends StatelessWidget {
  ThemeModelSheet({super.key});

  final LanguageThemeController controller = Get.put(LanguageThemeController());

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(18, 18, 18, 20),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        padding: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    "App Theme".tr,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      Assets.icons.icnClose,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(15),
                physics: const ClampingScrollPhysics(),
                itemCount: controller.themeList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.themeList.forEach((element) => element.isSelected = false);
                      controller.themeList[index].isSelected = true;
                      controller.updateTheme(controller.themeList[index].value ?? 'light');
                      controller.setUpdateTheme(controller.themeList[index].value);
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
                            Text(controller.themeList[index].name!,
                                style: controller.themeList[index].isSelected!
                                    ? Theme.of(context).textTheme.titleMedium
                                    : Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.textLightGreyColor)),
                            const Spacer(),
                            controller.themeList[index].isSelected!
                                ? Icon(
                                    Icons.check,
                                    color: AppColor.greenColor,
                                  )
                                : Icon(
                                    Icons.check,
                                    color: AppColor.iconGreyColor,
                                  )
                          ],
                        ),
                      ),
                    ]),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
