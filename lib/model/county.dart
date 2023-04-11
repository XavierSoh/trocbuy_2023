import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import '../utils/utils.dart';

part 'county.g.dart';

@JsonSerializable()
class County {

  @JsonKey(name: "id_county_lang")
  int? idCountyLang;

  @JsonKey(name: "id_county")
  int? idCounty;

  @JsonKey(name: "par_reg")
  int? parReg;

  @JsonKey(name: "code_lang")
  String? codeLang;

  @JsonKey(name: "name_county_lang")
  String? nameCountyLang;

  County(
      {this.idCountyLang,
      this.idCounty,
      this.parReg,
      this.codeLang,
      this.nameCountyLang});

  factory County.fromJson(Map<String, dynamic> json) => _$CountyFromJson(json);
  Map<String, dynamic> toJson() => _$CountyToJson(this);

  static List<County> counties = [];
  static Future<List<County>> getCounties() async {
    try {
      http
          .get(
        Uri.parse(
          Utils.countiesUrl,
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            var jsonResponse = jsonDecode(value.body);
            counties = List.from(jsonResponse)
                .map(
                  (e) => County.fromJson(e),
                )
                .toList();

            return counties;
          }
        },
      );
    } catch (exception) {
      if (kDebugMode) {}
    }

    return counties;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is County &&
          runtimeType == other.runtimeType &&
          idCountyLang == other.idCountyLang &&
          idCounty == other.idCounty &&
          parReg == other.parReg &&
          codeLang == other.codeLang &&
          nameCountyLang == other.nameCountyLang;

  @override
  int get hashCode =>
      idCountyLang.hashCode ^
      idCounty.hashCode ^
      parReg.hashCode ^
      codeLang.hashCode ^
      nameCountyLang.hashCode;
}
