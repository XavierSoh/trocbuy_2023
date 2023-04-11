import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import '../utils/utils.dart';

part "region.g.dart";

@JsonSerializable()
class Region {
  @JsonKey(name: "id_reg_lang")
  int idRegLang;

  @JsonKey(name: "id_reg")
  int idReg;

  @JsonKey(name: "code_lang")
  String codeLang;
  @JsonKey(name: "name_reg_lang")
  String nameRegLang;

  Region(
      {required this.idRegLang,
      required this.idReg,
      required this.codeLang,
      required this.nameRegLang});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);

  static List<Region> regions = [];
  static Future<List<Region>> setRegion() async {
    try {
      http
          .get(
        Uri.parse(Utils.regionsUrl),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            var jsonResponse = jsonDecode(value.body);

            regions = List.from(jsonResponse)
                .map(
                  (e) => Region.fromJson(e),
                )
                .toList();
            regions = [
              ...[
                Region(
                    nameRegLang: 'Choisissez la région',
                    codeLang: '',
                    idReg: -1,
                    idRegLang: -1)
              ],
              ...regions
            ];
            return regions;
          }
        },
      );
    } catch (exception) {
      if (kDebugMode) {}
    }

    return regions;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Region &&
          runtimeType == other.runtimeType &&
          idRegLang == other.idRegLang &&
          idReg == other.idReg &&
          codeLang == other.codeLang &&
          nameRegLang == other.nameRegLang;

  @override
  int get hashCode =>
      idRegLang.hashCode ^
      idReg.hashCode ^
      codeLang.hashCode ^
      nameRegLang.hashCode;
}
