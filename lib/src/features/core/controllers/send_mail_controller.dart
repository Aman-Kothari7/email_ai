import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMailController extends GetxController {
  RxBool hasUpgraded = false.obs;
  TextEditingController sendMailController = TextEditingController();
  dynamic argumentData = Get.arguments;
  SendMailController() {
    sendMailController.text = argumentData[0]["data"];
  }
  void upgradeAccount() {
    hasUpgraded.value = true;
  }
}
