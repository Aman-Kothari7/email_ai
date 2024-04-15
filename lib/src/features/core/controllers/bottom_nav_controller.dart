import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
