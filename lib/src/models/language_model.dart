import 'package:flag/flag_enum.dart';
import 'package:flutter/material.dart';

class LanguageModel {
  String? name;
  FlagsCode? flagProperty;
  Locale? locale;
  String? code;
  bool? isSelected;

  LanguageModel({this.name, this.flagProperty, this.locale, this.isSelected, this.code});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    flagProperty = json['flagProperty'];
    isSelected = json['isSelected'];
    locale = json['locale'];
    code = json['code'];
  }
}
