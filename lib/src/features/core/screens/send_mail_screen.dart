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
import '../controllers/send_mail_controller.dart';

enum OptionsMail { Rewrite, Share, Delete }

class SendMailScreen extends StatelessWidget {
  SendMailScreen({super.key});

  final SendMailController controller = Get.put(SendMailController());

  PopupMenuItem _buildPopupMenuItem(String title, String iconData, int position, context) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: title == "Delete" ? Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red) : Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            iconData,
          )
        ],
      ),
    );
  }

  var _popupMenuItemIndex = 0;
  _onMenuItemSelected(int value) {
    //setState(() {
    _popupMenuItemIndex = value;
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Text(
                        "My Mails".tr,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Spacer(),
                      PopupMenuButton(
                        icon: SvgPicture.asset(
                          Assets.icons.icnMore,
                        ),
                        onSelected: (value) {
                          _onMenuItemSelected(value as int);
                        },
                        offset: Offset(0.0, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        itemBuilder: (ctx) => [
                          _buildPopupMenuItem('Rewrite', Assets.icons.icnRewrite, OptionsMail.Rewrite.index, context),
                          _buildPopupMenuItem('Share', Assets.icons.icnShare, OptionsMail.Share.index, context),
                          _buildPopupMenuItem('Delete', Assets.icons.icnDelete, OptionsMail.Delete.index, context),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.67,
                    child: ContainerCard(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                TextFormFieldWithoutMaxLengthWidget(
                                  textFormController: controller.sendMailController,
                                  hintText: "",
                                  onChanged: (val) {
                                    //controller.writeMailLength.value = val.length;
                                  },
                                  maxLines: 23,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: AppButton(
                      'Send Mail'.tr,
                      () async {
                        try {} catch (ex) {
                          // Navigator.pop(context);
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
}
