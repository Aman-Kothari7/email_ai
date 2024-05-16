// To parse this JSON data, do
//
//     final promptsModel = promptsModelFromJson(jsonString);

import 'dart:convert';

List<PromptsModel> promptsModelFromJson(String str) => List<PromptsModel>.from(json.decode(str).map((x) => PromptsModel.fromJson(x)));

String promptsModelToJson(List<PromptsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PromptsModel {
  String title;
  String subTitle;
  String category;
  String description;
  String colorCode;

  PromptsModel({
    required this.title,
    required this.subTitle,
    required this.category,
    required this.description,
    required this.colorCode,
  });

  factory PromptsModel.fromJson(Map<String, dynamic> json) => PromptsModel(
        title: json["title"],
        subTitle: json["subTitle"],
        category: json["category"],
        description: json["description"],
        colorCode: json["colorCode"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "category": category,
        "description": description,
        "colorCode": colorCode,
      };
}
