import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constants/colors.dart';
import '../controllers/language_theme_controller.dart';

class AppLanguageModelSheet extends StatelessWidget {
  AppLanguageModelSheet({super.key});

  final LanguageThemeController controller = Get.put(LanguageThemeController());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        padding: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
        margin: EdgeInsets.fromLTRB(18, 18, 18, 20),
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
                    "App Language".tr,
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
                            Flag.fromCode(controller.languagesList[index].flagProperty!, width: 21, height: 15),
                            SizedBox(width: 10),
                            Text(controller.languagesList[index].name!, style: Theme.of(context).textTheme.titleMedium),
                            const Spacer(),
                            controller.languagesList[index].isSelected!
                                ? Icon(
                                    Icons.check,
                                    color: AppColor.primaryColor,
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
