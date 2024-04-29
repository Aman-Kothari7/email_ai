// write_screen.dart

import 'package:email_ai/src/constants/colors.dart';
import 'package:email_ai/src/features/core/screens/send_mail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../common_widgets/cards.dart';
import '../../../common_widgets/search_bar_widget.dart';
import '../../database/db.dart';
import '../controllers/emails_screen_controller.dart';
import '../models/my_email_model.dart';

class EmailsScreen extends StatefulWidget {
  @override
  State<EmailsScreen> createState() => _EmailsScreenState();
}

class _EmailsScreenState extends State<EmailsScreen> with AutomaticKeepAliveClientMixin {
  final MyEmailListController controller = Get.put(MyEmailListController());
  DBHelper? dbHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  List<MyEmailModel> emailList = [];
  List<MyEmailModel> searchList = [];
  Future<List<MyEmailModel>> loadData() async {
    var list = await dbHelper!.getMyEmailList();
    emailList.assignAll(list.reversed);
    searchList.assignAll(list.reversed);
    return searchList;
  }

  delete(id, data) async {
    await dbHelper!.deleteMyEmail(id);
    searchList.removeWhere((element) => element.id == id);
    emailList.removeWhere((element) => element.id == id);
    setState(() {});
    //emailList.refresh();
  }

  onCopy(index) async {
    await Clipboard.setData(ClipboardData(text: searchList[index].description)).then((value) {
      Get.showSnackbar(GetSnackBar(
        message: 'Copied',
        duration: const Duration(seconds: 2),
      ));
    });
  }

  onSend(index) async {
    try {
      final Email email = Email(
        body: searchList[index].description.replaceAll("\n", "<br>"),
        isHTML: true,
      );
      await FlutterEmailSender.send(email);
    } catch (ex) {
      print(ex);
    }
  }

  onTap(index) {
    FocusManager.instance.primaryFocus?.unfocus();
    print("dd");
    Get.to(() => SendMailScreen(id: searchList[index].id ?? 0), arguments: [
      {"data": searchList[index].description},
    ])!
        .then((value) {
      if (value ?? false) {
        searchTextEditController.text = "";
        searchList = emailList.toList();
        setState(() {});
      }
    });
  }

  TextEditingController searchTextEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SearchBarWidget(
        controller: searchTextEditController,
        onChanged: (value) {
          if (value != null && value.isNotEmpty) {
            searchList = emailList
                .where((item) =>
                    item.description.toLowerCase().contains(
                          value.toLowerCase(),
                        ) ||
                    item.title.toLowerCase().contains(value.toLowerCase()))
                .toList();
          } else {
            searchList = emailList.toList();
          }
          setState(() {});
        },
      ),
      SizedBox(height: 5),
      searchTextEditController.text.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyEmailCard(
                    dateTime: searchList[index].addedDate,
                    subTitleText: searchList[index].description,
                    titleText: searchList[index].title,
                    onDelete: () {
                      delete(searchList[index].id, index);
                    },
                    onShare: () {
                      Share.share(searchList[index].description);
                    },
                    onCopy: () async {
                      onCopy(index);
                    },
                    onSend: () {
                      onSend(index);
                    },
                    onTap: () {
                      onTap(index);
                    },
                  );
                },
              ),
            )
          : FutureBuilder(
              future: loadData(),
              builder: (context, AsyncSnapshot<List<MyEmailModel>> snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MyEmailCard(
                          dateTime: searchList[index].addedDate,
                          subTitleText: searchList[index].description,
                          titleText: searchList[index].title,
                          onDelete: () {
                            delete(searchList[index].id, searchList[index]);
                          },
                          onShare: () {
                            Share.share(searchList[index].description);
                          },
                          onCopy: () async {
                            onCopy(index);
                          },
                          onSend: () {
                            onSend(index);
                          },
                          onTap: () {
                            onTap(index);
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
    ]);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}

// Do similar stubs for PromptsScreen, EmailsScreen, and AccountScreen.
