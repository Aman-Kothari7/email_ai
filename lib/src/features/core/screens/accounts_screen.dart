// write_screen.dart

import 'package:email_ai/src/features/core/screens/appLanguage_modelSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../main.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      shrinkWrap: true,
      children: [
        GestureDetector(
          onTap: () {
            languageModelSheet(context);
          },
          child: Row(
            children: [
              Text(
                "App Language".tr,
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Text(
                (box.read('language') ?? 'English').toString(),
                style: TextStyle(fontSize: 16),
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
      ],
    );
  }

  languageModelSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return AppLanguageModelSheet();
        });
  }
}

// Do similar stubs for PromptsScreen, EmailsScreen, and AccountScreen.
