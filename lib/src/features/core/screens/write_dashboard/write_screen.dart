import 'package:email_ai/src/constants/colors.dart';
import 'package:email_ai/src/features/core/screens/write_dashboard/preference_tags_modelSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../common_widgets/app_button.dart';
import '../../../../common_widgets/cards.dart';
import '../../controllers/write_controller.dart';

class WriteScreen extends StatelessWidget {
  WriteScreen({super.key});
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
                  height: MediaQuery.of(context).size.height * 0.47,
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
                              TextFormField(
                                controller: controller.writeMailController,
                                decoration: InputDecoration(
                                  hintText: "Ex.\nWrite me a mail asking for a follow up from the HR of [Company Name]".tr,
                                  hintStyle: Theme.of(context).textTheme.labelLarge,
                                  border: InputBorder.none,
                                  fillColor: Colors.transparent,
                                  counterText: "",
                                ),
                                autofocus: false,
                                cursorColor: AppColor.primaryColor,
                                onChanged: (val) {
                                  controller.writeMailLength.value = val.length;
                                },
                                maxLength: 4096,
                                maxLines: 12,
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
                    PreferenceTagsModelSheet(context);
                  },
                  child: ContainerCard(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        "Preference Tags".tr,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
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
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      (controller.textTypeList.where((element) => element.isSelected == true)).first.title.tr,
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Assets.images.astonishedFace.image(
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      (controller.textLengthList.where((element) => element.isSelected == true)).first.title.tr,
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Assets.images.astonishedFace.image(
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      (controller.writingToneList.where((element) => element.isSelected == true)).first.title.tr,
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Assets.images.astonishedFace.image(
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
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
            textStyle: TextStyle(fontSize: 18, color: AppColor.whiteColor),
          ),
        ),
      ),
    );
  }

  PreferenceTagsModelSheet(context) {
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
