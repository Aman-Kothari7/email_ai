import 'package:email_ai/src/features/core/screens/write_dashboard/preference_tags_modelSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../models/preference_tags_model.dart';

class WriteController extends GetxController {
  final RxInt writeMailLength = 0.obs;
  RxList<WritingTone> textTypeList = <WritingTone>[].obs;
  RxList<WritingTone> textLengthList = <WritingTone>[].obs;
  RxList<WritingTone> writingToneList = <WritingTone>[].obs;
  RxList<WritingTone> useEmojiList = <WritingTone>[].obs;
  RxList<WritingTone> selectedList = <WritingTone>[].obs;
  TextEditingController writeMailController = TextEditingController();

  WriteController() {
    loadPreferenceTagsModel();
  }
  PreferenceTagsModel? preferenceTagsList;
  loadPreferenceTagsModel() async {
    String jsonString = await rootBundle.loadString('assets/jsonData/preference_tags.json');
    preferenceTagsList = preferenceTagsModelFromJson(jsonString);
    textTypeList.value = preferenceTagsList!.textType;
    textLengthList.value = preferenceTagsList!.textLength;
    writingToneList.value = preferenceTagsList!.writingTone;
    useEmojiList.value = preferenceTagsList!.useEmoji;
  }

  selectLoadPreferenceTagsModel(WritingTone tag, int position) async {
    if (position == 0) {
      textTypeList.forEach((element) => element.isSelected = false);
      int ind = textTypeList.indexWhere((element) => element.title == tag.title);
      textTypeList[ind].isSelected = true;
      textTypeList.refresh();
    } else if (position == 1) {
      textLengthList.forEach((element) => element.isSelected = false);
      textLengthList[textLengthList.indexWhere((element) => element.title == tag.title)].isSelected = true;
      textLengthList.refresh();
    } else if (position == 2) {
      writingToneList.forEach((element) => element.isSelected = false);
      writingToneList[writingToneList.indexWhere((element) => element.title == tag.title)].isSelected = true;
      writingToneList.refresh();
    } else {
      useEmojiList.forEach((element) => element.isSelected = false);
      useEmojiList[useEmojiList.indexWhere((element) => element.title == tag.title)].isSelected = true;
      useEmojiList.refresh();
    }
  }

  void setLength(int index) {
    writeMailLength.value = index;
    //update();
  }

  void clear() {
    writeMailController.text = "";
    writeMailLength.value = 0;
    // update();
  }
}
