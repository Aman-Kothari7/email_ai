import 'package:get/get.dart';

class UpgradeButtonController extends GetxController {
  RxBool hasUpgraded = false.obs;

  void upgradeAccount() {
    hasUpgraded.value = true;
  }
}
