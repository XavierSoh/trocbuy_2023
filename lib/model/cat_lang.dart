import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import '../utils/utils.dart';

part 'cat_lang.g.dart';

@JsonSerializable()
class CatLang {
  @JsonKey(name: "id_cat_lang")
  int? idCatLang;

  @JsonKey(name: "id_cat")
  int? idCat;

  @JsonKey(name: "par_cat")
  int? parCat;

  @JsonKey(name: "code_lang")
  String? codeLang;

  @JsonKey(name: "name_cat_lang")
  String? nameCatLang;

  int? quantity;
  CatLang(
      {this.idCatLang,
      this.idCat,
      this.parCat,
      this.codeLang,
      this.nameCatLang,
      this.quantity});

  factory CatLang.fromJson(Map<String, dynamic> json) =>
      _$CatLangFromJson(json);
  Map<String, dynamic> toJson() => _$CatLangToJson(this);

  static List<CatLang> catsLang = <CatLang>[];
  static List<CatLang> cats = <CatLang>[];
  static List<CatLang> Subcats = <CatLang>[];
  static setCatsLangList() async {
    try {
      String url = Utils.baseUrl +
          "/get_table.php?table=TROC9_cat_lang&code_lang=${Utils.getCodeLang()}";
      var response = await http.get(
        Uri.parse(url),
      );
      catsLang = List.from(
        jsonDecode(response.body),
      )
          .map(
            (e) => CatLang.fromJson(e),
          )
          .toList();
      cats = catsLang.where((element) => element.parCat == 0).toList();
      Subcats = catsLang.where((element) => element.parCat != 0).toList();
      CatLang.cats.sort(
        (a, b) => a.nameCatLang!.compareTo(b.nameCatLang!),
      );
      CatLang.Subcats.sort(
        (a, b) => a.nameCatLang!.compareTo(b.nameCatLang!),
      );
      cats = [
        ...[CatLang(nameCatLang: 'Choisissez la catégorie', parCat: 0)],
        ...cats
      ];
      Subcats = [
        ...[CatLang(nameCatLang: 'Choisissez la sous catégorie', parCat: -1)],
        ...Subcats
      ];
    } catch (exception) {
      if (kDebugMode) {}
    }
  }
}
