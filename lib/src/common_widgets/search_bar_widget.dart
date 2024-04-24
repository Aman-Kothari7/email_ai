import 'package:email_ai/src/common_widgets/text_form_field.dart';
import 'package:email_ai/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../gen/assets.gen.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    this.onChanged,
    this.controller,
  });
  final void Function(String?)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: AppTextField(
        label: '',
        hint: 'Search Prompts or Tags',
        fillColor: Theme.of(context).cardColor,
        onChanged: onChanged,
        controller: controller,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: SizedBox(
            height: 30,
            width: 30,
            child: Center(
              child: SvgPicture.asset(Assets.icons.iconSearch
                  //colorFilter: ColorFilter.mode(AppColor.greyColor1.withOpacity(0.70), BlendMode.srcIn),
                  ),
            ),
          ),
        ),
        // hintStyle: textMedium.copyWith(color: AppColor.greyColor),
        // textStyle: textMedium.copyWith(color: AppColor.blackColor),
      ),
    );
  }
}
