import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../controllers/write_controller.dart';
import '../common_screen.dart';

class WriteScreen extends StatelessWidget {
  WriteScreen({super.key});
  final WriteController controller = Get.put(WriteController());

  @override
  Widget build(BuildContext context) {
    return CommonWrite(
      height: MediaQuery.of(context).size.height * 0.38,
      maxLines: 12,
    );
  }
}
