import 'package:email_ai/src/constants/colors.dart';
import 'package:email_ai/src/features/core/screens/send_mail_screen.dart';
import 'package:email_ai/src/features/core/screens/write_dashboard/preference_tags_modelSheet.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../main.dart';
import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/cards.dart';
import '../../../common_widgets/text_form_field.dart';
import '../../../common_widgets/top_app_bar.dart';
import '../controllers/write_controller.dart';

class CommonWrite extends StatelessWidget {
  double height;
  int maxLines;
  bool? isRequiredAppbar;
  CommonWrite({required this.height, required this.maxLines, this.isRequiredAppbar, super.key});

  final WriteController controller = Get.put(WriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (isRequiredAppbar ?? false)
          ? TopAppBar()
          : AppBar(
              toolbarHeight: 0,
            ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height,
                    child: ContainerCard(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Text(
                                    "${controller.writeMailLength.value}/4096",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  )),
                              GestureDetector(
                                onTap: () {
                                  controller.clear();
                                },
                                child: Text(
                                  "Clear".tr,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                TextFormFieldWidget(
                                  textFormController: controller.writeMailController,
                                  hintText: "Ex.\nWrite me a mail asking for a follow up from the HR of [Company Name]".tr,
                                  onChanged: (val) {
                                    controller.writeMailLength.value = val.length;
                                  },
                                  maxLength: 4096,
                                  maxLines: this.maxLines,
                                ),
                                Obx(() => (controller.writeMailLength.value > 0)
                                    ? SizedBox.shrink()
                                    : Align(
                                        alignment: Alignment.bottomRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            print("mic");
                                          },
                                          child: SvgPicture.asset(
                                            Assets.icons.icnMic,
                                          ),
                                        ),
                                      )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      preferenceTagsModelSheet(context);
                    },
                    child: ContainerCard(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          "Preference Tags".tr,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Obx(
                          () => controller.textTypeList.length > 0
                              ? SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Assets.images.astonishedFace.image(
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        (controller.textTypeList.where((element) => element.isSelected == true)).first.title.tr,
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Assets.images.astonishedFace.image(
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        (controller.textLengthList.where((element) => element.isSelected == true)).first.title.tr,
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Assets.images.astonishedFace.image(
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        (controller.writingToneList.where((element) => element.isSelected == true)).first.title.tr,
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Assets.images.astonishedFace.image(
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        (controller.useEmojiList.where((element) => element.isSelected == true)).first.title.tr,
                                        style: Theme.of(context).textTheme.bodySmall,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox.shrink(),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(() => GestureDetector(
                        onTap: () {
                          languageModelSheet(context);
                        },
                        child: ContainerCard(
                          child: Row(
                            children: [
                              Text(
                                "Output Language".tr,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Spacer(),
                              Flag.fromCode(box.read('outputLanguageFlag') ?? FlagsCode.GB, width: 21, height: 15),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                controller.selectedOutputLanguage.value,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Icon(Icons.chevron_right, color: AppColor.iconGreyColor)
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 55,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  (isRequiredAppbar ?? false)
                      ? Expanded(
                          flex: 1,
                          child: AppButton('Back'.tr, () {
                            Get.back();
                          },
                              isLoading: false,
                              textStyle: Theme.of(context).textTheme.titleMedium,
                              borderColor: AppColor.iconGreyColor,
                              color: Colors.transparent,
                              isSecondaryBackground: true),
                        )
                      : SizedBox.shrink(),
                  (isRequiredAppbar ?? false)
                      ? SizedBox(
                          width: 10,
                        )
                      : SizedBox.shrink(),
                  Expanded(
                    flex: 3,
                    child: AppButton(
                      'Generate'.tr,
                      () async {
                        try {
                          if (controller.writeMailController.text.isNotEmpty) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            showLoader(context);
                            String userPrompt = controller.writeMailController.text;
                            var textType = (controller.textTypeList.where((element) => element.isSelected == true)).first.title.tr;
                            var textLength = (controller.textLengthList.where((element) => element.isSelected == true)).first.title.tr;
                            var textWritingTone = (controller.writingToneList.where((element) => element.isSelected == true)).first.title.tr;
                            var useEmoji = (controller.useEmojiList.where((element) => element.isSelected == true)).first.title.tr;

                            String prompt =
                                "Write an ${textType} according to the following prompt given by the user: $userPrompt\n$textType\n$textLength\n$textWritingTone\n$useEmoji";
                            print(prompt);
                            await controller.chatGPTAPI(prompt, title: controller.writeMailController.value);
                          } else {
                            Get.showSnackbar(
                              GetSnackBar(
                                message: "Please Enter value",
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                          controller.clear();
                        } catch (ex) {
                          Get.showSnackbar(
                            GetSnackBar(
                              message: ex.toString(),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      isLoading: false,
                      textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
          return SingleChildScrollView(
              child: Container(
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
                              "Output Language".tr,
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
                          itemCount: controller.languagesOutputList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.languagesOutputList.forEach((element) => element.isSelected = false);
                                controller.languagesOutputList[index].isSelected = true;
                                controller.setOutputUpdateLanguage(controller.languagesOutputList[index]);
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
                                      Flag.fromCode(controller.languagesOutputList[index].flagProperty!, width: 21, height: 15),
                                      SizedBox(width: 10),
                                      Text(controller.languagesOutputList[index].name!, style: Theme.of(context).textTheme.titleMedium),
                                      const Spacer(),
                                      controller.languagesOutputList[index].isSelected!
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
                  )));
        });
  }

  preferenceTagsModelSheet(context) {
    showModalBottomSheet(
        context: context,
        //barrierColor: Colors.white.withOpacity(0.2),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return PreferenceTagModelSheet();
        });
  }
}
