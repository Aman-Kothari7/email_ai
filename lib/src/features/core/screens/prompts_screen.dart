// write_screen.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_ai/src/common_widgets/app_button.dart';
import 'package:email_ai/src/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../common_widgets/cards.dart';
import '../../../common_widgets/search_bar_widget.dart';
import '../controllers/prompts_controller.dart';
import '../controllers/write_controller.dart';
import '../models/prompts_model.dart';
import 'common_screen.dart';

class PromptsScreen extends StatelessWidget {
  final PromptsController controller = Get.put(PromptsController());

  addTask(context) async {
    try {
      showLoader(context);
      CollectionReference task = await FirebaseFirestore.instance.collection("prompts");

      task.doc().set({
        "title": "Seeking Advice on Career Transition",
        "subTitle": "Navigating New Career Horizons",
        "category": "Networking",
        "description":
            "Dear [Name], I’m currently exploring new career opportunities in [Industry], and I noticed you made a similar transition. If possible, I would appreciate any advice or insights you could share about your experience. Could we schedule a time to talk?",
        "colorCode": "6935FF"
      }).then((value) async {
        print("Added");
        Navigator.pop(context);
      });
    } catch (e) {
      print(e);
      Navigator.pop(context);
    }
  }

  Color stringToColor(String color) {
    return Color(int.parse("0xFF" + color.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // GestureDetector(
      //   onTap: () async {
      //     await addTask(context);
      //   },
      //   child: Text("add"),
      // ),
      SearchBarWidget(
        controller: controller.searchTextEditController,
        onChanged: (value) {
          controller.search(value);
        },
      ),
      SizedBox(
        height: 5,
      ),
      GetBuilder<PromptsController>(
          builder: (controller) => controller.searchList.length > 0
              ? Expanded(
                  child: ListView.builder(
                      itemCount: controller.searchList.length,
                      itemBuilder: (context, index) {
                        var bookMark = controller.bookMarkList
                            .where((element) => element.title.toLowerCase() == controller.searchList[index].title.toLowerCase())
                            .singleOrNull;
                        return PromptCard(
                          typeContainerColor: stringToColor(controller.searchList[index].colorCode),
                          typeContainerText: controller.searchList[index].category,
                          isBookmark: bookMark == null ? false : true,
                          subTitleText: controller.searchList[index].subTitle,
                          titleText: controller.searchList[index].title,
                          onBookMark: () {
                            controller.addBookmark(bookMark == null ? false : true, index);
                          },
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommonWrite(
                                        isRequiredAppbar: true,
                                        height: MediaQuery.of(context).size.height * 0.5,
                                        maxLines: 12,
                                        title: controller.searchList[index].title,
                                        description: controller.searchList[index].description,
                                      )),
                            ).then((value) {
                              final WriteController controller = Get.put(WriteController());
                              controller.clear();
                              controller.clearEmailReplay();
                              controller.clearReplay();
                            });
                          },
                        );
                      }),
                )
              : CircularProgressIndicator()),
    ]);
  }
}

// Do similar stubs for PromptsScreen, EmailsScreen, and AccountScreen.
