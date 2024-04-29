import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../database/db.dart';

class SendMailController extends GetxController {
  RxBool hasUpgraded = false.obs;
  TextEditingController sendMailController = TextEditingController();
  dynamic argumentData = Get.arguments;
  DBHelper? dbHelper;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dbHelper = DBHelper();
  }

  SendMailController() {
    sendMailController.text = argumentData[0]["data"] ?? '';
  }
  void upgradeAccount() {
    hasUpgraded.value = true;
  }
}
