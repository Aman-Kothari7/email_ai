// To parse this JSON data, do
//
//     final preferenceTagsModel = preferenceTagsModelFromJson(jsonString);

import 'dart:convert';

PreferenceTagsModel preferenceTagsModelFromJson(String str) => PreferenceTagsModel.fromJson(json.decode(str));

String preferenceTagsModelToJson(PreferenceTagsModel data) => json.encode(data.toJson());

class PreferenceTagsModel {
  List<WritingTone> textType;
  List<WritingTone> textLength;
  List<WritingTone> writingTone;
  List<WritingTone> useEmoji;

  PreferenceTagsModel({
    required this.textType,
    required this.textLength,
    required this.writingTone,
    required this.useEmoji,
  });

  factory PreferenceTagsModel.fromJson(Map<String, dynamic> json) => PreferenceTagsModel(
        textType: List<WritingTone>.from(json["textType"].map((x) => WritingTone.fromJson(x))),
        textLength: List<WritingTone>.from(json["textLength"].map((x) => WritingTone.fromJson(x))),
        writingTone: List<WritingTone>.from(json["WritingTone"].map((x) => WritingTone.fromJson(x))),
        useEmoji: List<WritingTone>.from(json["useEmoji"].map((x) => WritingTone.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "textType": List<dynamic>.from(textType.map((x) => x.toJson())),
        "textLength": List<dynamic>.from(textLength.map((x) => x.toJson())),
        "WritingTone": List<dynamic>.from(writingTone.map((x) => x.toJson())),
        "useEmoji": List<dynamic>.from(useEmoji.map((x) => x.toJson())),
      };
}

class WritingTone {
  String icon;
  String title;
  bool isSelected;

  WritingTone({
    required this.icon,
    required this.title,
    required this.isSelected,
  });

  factory WritingTone.fromJson(Map<String, dynamic> json) => WritingTone(
        icon: json["icon"],
        title: json["title"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "isSelected": isSelected,
      };
}
