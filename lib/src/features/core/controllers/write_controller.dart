import 'dart:convert';

import 'package:email_ai/src/features/core/screens/write_dashboard/preference_tags_modelSheet.dart';
import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../../../../main.dart';
import '../models/language_model.dart';
import '../models/preference_tags_model.dart';

class WriteController extends GetxController {
  final RxInt writeMailLength = 0.obs;
  final RxInt replayMailLength = 0.obs;
  final RxInt replayLength = 0.obs;
  final RxInt grammarMailLength = 0.obs;
  RxList<WritingTone> textTypeList = <WritingTone>[].obs;
  RxList<WritingTone> textLengthList = <WritingTone>[].obs;
  RxList<WritingTone> writingToneList = <WritingTone>[].obs;
  RxList<WritingTone> useEmojiList = <WritingTone>[].obs;
  RxList<WritingTone> selectedList = <WritingTone>[].obs;
  TextEditingController writeMailController = TextEditingController();
  TextEditingController replayMailController = TextEditingController();
  TextEditingController replayController = TextEditingController();
  TextEditingController grammarController = TextEditingController();
  List<LanguageModel> languagesOutputList = [];
  RxString selectedOutputLanguage = "".obs;

  WriteController() {
    loadPreferenceTagsModel();

    languagesOutputList = List.from([
      LanguageModel(
        name: 'English',
        flagProperty: FlagsCode.GB,
        code: ('en'),
        isSelected: true,
      ),
      LanguageModel(
        name: 'Spanish',
        flagProperty: FlagsCode.ES,
        code: ('sp'),
        isSelected: false,
      ),
      LanguageModel(
        name: 'French',
        flagProperty: FlagsCode.FR,
        code: ('fr'),
        isSelected: false,
      ),
    ]);
    languagesOutputList.forEach((element) => element.isSelected = false);
    var storedValue = box.read('outputLanguageCode') ?? 'en';
    var storeData = languagesOutputList.indexWhere((element) => element.code == storedValue);
    languagesOutputList[storeData].isSelected = true;
    selectedOutputLanguage.value = languagesOutputList[storeData].name!;
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

  Future<void> setOutputUpdateLanguage(LanguageModel value) async {
    box.write('outputLanguageCode', value.code);
    box.write('outputLanguage', value.name);
    box.write('outputLanguageFlag', value.flagProperty);
    selectedOutputLanguage.value = value.name!;
    Get.back();
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

  void clearEmailReplay() {
    replayMailController.text = "";
    replayMailLength.value = 0;
    // update();
  }

  void clearReplay() {
    replayController.text = "";
    replayLength.value = 0;
    // update();
  }

  void clearGrammar() {
    grammarController.text = "";
    grammarMailLength.value = 0;
    // update();
  }

  RxString _response = ''.obs;

  String get response => _response.value;

  Future<String> chatGPTAPI(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_openAiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content': prompt,
            }
          ],
        }),
      );

      if (res.statusCode == 200) {
        String content = jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        return _response.value = content;
      } else {
        return _response.value = 'An internal error occurred';
      }
    } catch (e) {
      return _response.value = e.toString();
    }
  }
}
