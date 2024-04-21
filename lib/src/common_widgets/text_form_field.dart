import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    required this.textFormController,
    required this.maxLength,
    required this.hintText,
    this.maxLines,
    required this.onChanged,
    super.key,
  });

  TextEditingController textFormController;
  String hintText;
  int maxLength;
  int? maxLines;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFormController,
      decoration: InputDecoration(
          hintText: hintText.tr,
          hintStyle: Theme.of(context).textTheme.labelLarge,
          border: InputBorder.none,
          fillColor: Colors.transparent,
          counterText: ""),
      autofocus: false,
      cursorColor: AppColor.primaryColor,
      onChanged: onChanged,
      maxLength: maxLength,
      maxLines: maxLines,
    );
  }
}
