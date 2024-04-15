import 'package:email_ai/src/constants/colors.dart';
import 'package:email_ai/src/features/core/controllers/write_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../gen/assets.gen.dart';
import '../../models/preference_tags_model.dart';

class PreferenceTagModelSheet extends StatelessWidget {
  PreferenceTagModelSheet({super.key});

  final WriteController controller = Get.put(WriteController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.84,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )),
      padding: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
      margin: EdgeInsets.fromLTRB(18, 18, 18, 20),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        // crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Preference Tags".tr,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //0
                Text(
                  "Text Type".tr,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Wrap(
                      children: List.generate(
                    controller.textTypeList.length,
                    (index) {
                      return tags(controller.textTypeList[index], context, 0);
                    },
                  )),
                ),
                SizedBox(
                  height: 15,
                ),
                //1
                Text(
                  "Text Length".tr,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Wrap(
                      children: List.generate(
                        controller.textLengthList.length,
                        (index) {
                          return tags(controller.textLengthList[index], context, 1);
                        },
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                //2
                Text(
                  "Writing Tone".tr,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Wrap(
                      children: List.generate(
                        controller.writingToneList.length,
                        (index) {
                          return tags(controller.writingToneList[index], context, 2);
                        },
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                //3
                Text(
                  "Use Emoji".tr,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Wrap(
                      children: List.generate(
                        controller.useEmojiList.length,
                        (index) {
                          return tags(controller.useEmojiList[index], context, 3);
                        },
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tags(WritingTone tag, BuildContext context, int position) {
    return GestureDetector(
      onTap: () {
        controller.selectLoadPreferenceTagsModel(tag, position);
      },
      child: Container(
          margin: EdgeInsets.only(right: 6, bottom: 8),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: tag.isSelected ? AppColor.lightYellowColor.withOpacity(0.5) : null,
            border: Border.all(
              color: tag.isSelected
                  ? AppColor.yellowColor
                  : Theme.of(context).brightness == Brightness.dark
                      ? AppColor.darkGreyColor
                      : AppColor.lightGreyBorder,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.images.astonishedFace.image(
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                tag.title.tr,
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          )),
    );
  }
}
