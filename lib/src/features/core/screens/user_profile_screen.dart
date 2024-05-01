import 'package:email_ai/src/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../common_widgets/app_button.dart';
import '../../../common_widgets/cards.dart';
import '../../../common_widgets/text_form_field.dart';
import '../../../common_widgets/top_app_bar.dart';
import '../controllers/account_controller.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  final AccountController controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 50,
                          child: ClipOval(
                            child: SvgPicture.asset(
                              Assets.icons.userProfile,
                            ),
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "User Profile".tr,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Supercharge your writing experience with AI by providing following Details".tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.63,
                    child: ContainerCard(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          AppTextField(
                            controller: controller.nameController,
                            hint: "Your Name",
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            onChanged: (val) {
                              //controller.writeMailLength.value = val.length;
                            },
                            keyboardAction: TextInputAction.next,
                            label: '',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            controller: controller.ageController,
                            hint: "Your Age",
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            onChanged: (val) {
                              //controller.writeMailLength.value = val.length;
                            },
                            keyboardAction: TextInputAction.next,
                            label: '',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Obx(() => Row(
                                children: [
                                  Container(
                                    width: 90,
                                    child: RadioListTile(
                                      contentPadding: EdgeInsets.zero,
                                      dense: true,
                                      fillColor: MaterialStateProperty.resolveWith((states) {
                                        // active
                                        if (states.contains(MaterialState.selected)) {
                                          return AppColor.primaryColor;
                                        }
                                        // inactive
                                        return AppColor.textLightGreyColor;
                                      }),
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      title: Text("Male", style: Theme.of(context).textTheme.bodyLarge),
                                      value: "Male",
                                      groupValue: controller.gender.value,
                                      onChanged: (value) {
                                        controller.gender.value = value.toString();
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: RadioListTile(
                                      dense: true,
                                      fillColor: MaterialStateProperty.resolveWith((states) {
                                        // active
                                        if (states.contains(MaterialState.selected)) {
                                          return AppColor.primaryColor;
                                        }
                                        // inactive
                                        return AppColor.textLightGreyColor;
                                      }),
                                      contentPadding: EdgeInsets.zero,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      visualDensity: const VisualDensity(
                                        horizontal: VisualDensity.minimumDensity,
                                        vertical: VisualDensity.minimumDensity,
                                      ),
                                      title: Text("Female", style: Theme.of(context).textTheme.bodyLarge),
                                      value: "Female",
                                      groupValue: controller.gender.value,
                                      onChanged: (value) {
                                        controller.gender.value = value.toString();
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            controller: controller.companyController,
                            hint: "Your Company Name",
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            onChanged: (val) {
                              //controller.writeMailLength.value = val.length;
                            },
                            keyboardAction: TextInputAction.next,
                            label: '',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            controller: controller.roleController,
                            hint: "Your Profession / Job Role",
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            onChanged: (val) {
                              //controller.writeMailLength.value = val.length;
                            },
                            keyboardAction: TextInputAction.next,
                            label: '',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            controller: controller.educationController,
                            hint: "Your Education",
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            onChanged: (val) {
                              //controller.writeMailLength.value = val.length;
                            },
                            keyboardAction: TextInputAction.next,
                            label: '',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          AppTextField(
                            controller: controller.yourSelfController,
                            hint: "Write about Yourself",
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            onChanged: (val) {
                              //controller.writeMailLength.value = val.length;
                            },
                            minLise: 3,
                            maxLines: 3,
                            keyboardAction: TextInputAction.go,
                            label: '',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 55,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 1,
                    child: AppButton('Back'.tr, () {
                      Get.back();
                    },
                        isLoading: false,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        borderColor: AppColor.iconGreyColor,
                        color: Colors.transparent,
                        isSecondaryBackground: true),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 2,
                    child: AppButton(
                      'Save'.tr,
                      () async {
                        controller.save();
                        Get.back();
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
}
