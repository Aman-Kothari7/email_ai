import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../common_widgets/app_button.dart';
import '../../../../common_widgets/cards.dart';
import '../../../../common_widgets/text_form_field.dart';
import '../../../../constants/colors.dart';
import '../../controllers/write_controller.dart';

class GrammarScreen extends StatelessWidget {
  GrammarScreen({super.key});
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
                  height: MediaQuery.of(context).size.height * 0.58,
                  child: ContainerCard(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => Text(
                                  "${controller.grammarMailLength.value}/4096",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )),
                            GestureDetector(
                              onTap: () {
                                controller.clearGrammar();
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
                                textFormController: controller.grammarController,
                                hintText: "Write here to check Grammar.".tr,
                                onChanged: (val) {
                                  controller.grammarMailLength.value = val.length;
                                },
                                maxLength: 4096,
                                maxLines: 18,
                              ),
                              Obx(() => (controller.grammarMailLength.value > 0)
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
}
