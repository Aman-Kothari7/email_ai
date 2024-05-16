import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_ai/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/prompts_model.dart';

class PromptsController extends GetxController {
  List<PromptsModel> promptsList = [];
  List<PromptsModel> searchList = [];
  List<PromptsModel> bookMarkList = [];
  PromptsController() {
    getPromptsList().then((value) {
      var data = box.read("bookMarkList");
      if (data != null) {
        bookMarkList = promptsModelFromJson(data);
      }
      promptsList = value.toList();
      searchList = value.toList();
      update();
    });
  }
  TextEditingController searchTextEditController = TextEditingController();

  addBookmark(bool isBookmark, int index) {
    if (!isBookmark) {
      bookMarkList.add(searchList[index]);
    } else {
      bookMarkList.removeWhere((element) => element.title == searchList[index].title);
    }
    box.write("bookMarkList", promptsModelToJson(bookMarkList));
    update();
  }

  search(value) {
    if (value != null && value.isNotEmpty) {
      searchList = promptsList
          .where((item) =>
              item.category.toLowerCase().contains(
                    value.toLowerCase(),
                  ) ||
              item.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      searchList = promptsList.toList();
    }
    update();
  }

  Future<List<PromptsModel>> getPromptsList() async {
    QuerySnapshot qShot = await FirebaseFirestore.instance.collection('prompts').get();
    return qShot.docs
        .map((doc) => PromptsModel(
              title: doc['title'],
              category: doc['category'],
              colorCode: doc['colorCode'],
              description: doc['description'],
              subTitle: doc['subTitle'],
            ))
        .toList();
  }
}
