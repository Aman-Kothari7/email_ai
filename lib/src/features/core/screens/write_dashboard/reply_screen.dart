import 'package:email_ai/src/features/core/screens/write_dashboard/preference_tags_modelSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../common_widgets/app_button.dart';
import '../../../../common_widgets/cards.dart';
import '../../../../common_widgets/text_form_field.dart';
import '../../../../constants/colors.dart';
import '../../controllers/write_controller.dart';

class ReplayScreen extends StatelessWidget {
  ReplayScreen({super.key});

  final WriteController controller = Get.put(WriteController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
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
                                controller.clearEmailReplay();
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
                                textFormController: controller.replayMailController,
                                hintText: "Paste Email here".tr,
                                onChanged: (val) {
                                  controller.replayMailLength.value = val.length;
                                },
                                maxLength: 4096,
                                maxLines: 6,
                              ),
                              Obx(() => (controller.replayMailLength.value > 0)
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
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
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
                                controller.clearReplay();
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
                                textFormController: controller.replayController,
                                hintText: "Explain how to reply to these text".tr,
                                onChanged: (val) {
                                  controller.replayLength.value = val.length;
                                },
                                maxLength: 4096,
                                maxLines: 6,
                              ),
                              Obx(() => (controller.replayLength.value > 0)
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
                        ),
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
              ],
            ),
          ),
          bottomNavigationBar: AppButton(
            'Generate'.tr,
            () {},
            isLoading: false,
            textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.whiteColor),
          ),
        ),
      ),
    );
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
