import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:trocbuy/model/ad.dart';

import '../../model/filter_option.dart';
import '../../utils/utils.dart';

class FilterFunctions {
  static Future filterOptions(int idCat) async {
    List<FilterOption> filterOptions = [];
    try {
      String url =
          "https://api.trocbuy.fr/flutter/xav_cat_option.php?id_cat=$idCat";
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);
      Iterable jsonResponse = jsonDecode(response.body);
      filterOptions = List.from(
        jsonResponse.map(
          (e) => FilterOption.fromJson(e),
        ),
      );
    } catch (exception) {
      if (kDebugMode) {}
    }
    return filterOptions;
  }

  static Future<List<Ad>> sendFilterRequest(Map<String, dynamic> body) async {
    List<Ad> ads = [];
    try {
      String url = Utils.baseUrl + "/xav_filter.php";
      await http
          .post(
        Uri.parse(url),
        body: jsonEncode(
          body,
        ),
      )
          .then(
        (response) {
          if (response.statusCode == 200) {
            var jsonResponse = jsonDecode(response.body);
            ads =
                List.from(jsonResponse).map<Ad>((e) => Ad.fromJson(e)).toList();
          } else {
            //TODO:shos error alert dialog
          }
        },
      ).timeout(
        const Duration(seconds: 300),
        onTimeout: () {
          //TODO:HANDLE ON TIME OUT
        },
      );
    } catch (exception) {
      if (kDebugMode) {}
    }
    return ads;
  }

  static List<FilterOption> reformatFilterOptions(
      List<FilterOption> filterOptions) {
    filterOptions = [
      ...filterOptions.where((element) =>
          element.optionsNames[0].nameCatOptLang.toLowerCase() == "marque"),
      ...filterOptions.where((element) =>
          element.optionsNames[0].nameCatOptLang.toLowerCase() ==
          "type de voiture"),
      ...filterOptions.where((element) =>
          removeDiacritics(
            element.optionsNames[0].nameCatOptLang.toLowerCase(),
          ) ==
          "année modèle"),
      ...filterOptions.where((element) =>
          removeDiacritics(
            element.optionsNames[0].nameCatOptLang.toLowerCase(),
          ) ==
          "energie"),
      ...filterOptions.where((element) =>
          removeDiacritics(
            element.optionsNames[0].nameCatOptLang.toLowerCase(),
          ) ==
          "boite de vitesse"),
      ...filterOptions.where((element) =>
          removeDiacritics(
            element.optionsNames[0].nameCatOptLang.toLowerCase(),
          ) ==
          "nombre de porte"),
      ...filterOptions.where((element) =>
          removeDiacritics(
            element.optionsNames[0].nameCatOptLang.toLowerCase(),
          ) ==
          "nombre de place"),
      ...filterOptions.where((element) =>
          removeDiacritics(
            element.optionsNames[0].nameCatOptLang.toLowerCase(),
          ) ==
          "couleur"),
      ...filterOptions.where((element) =>
          removeDiacritics(
            element.optionsNames[0].nameCatOptLang.toLowerCase(),
          ) ==
          "kilometrage"),
      ...filterOptions.where((element) =>
          removeDiacritics(
            element.optionsNames[0].nameCatOptLang.toLowerCase(),
          ) ==
          "energie"),
      ...filterOptions.where((element) {
        return element.optionsNames[0].nameCatOptLang.toLowerCase() !=
                "marque" &&
            element.optionsNames[0].nameCatOptLang.toLowerCase() !=
                "type de voiture" &&
            removeDiacritics(
                  element.optionsNames[0].nameCatOptLang.toLowerCase(),
                ) !=
                "année modèle" &&
            removeDiacritics(
                  element.optionsNames[0].nameCatOptLang.toLowerCase(),
                ) !=
                "energie" &&
            removeDiacritics(
                  element.optionsNames[0].nameCatOptLang.toLowerCase(),
                ) !=
                "boite de vitesse" &&
            removeDiacritics(
                  element.optionsNames[0].nameCatOptLang.toLowerCase(),
                ) !=
                "nombre de porte" &&
            removeDiacritics(
                  element.optionsNames[0].nameCatOptLang.toLowerCase(),
                ) !=
                "nombre de place" &&
            removeDiacritics(
                  element.optionsNames[0].nameCatOptLang.toLowerCase(),
                ) !=
                "couleur" &&
            removeDiacritics(
                  element.optionsNames[0].nameCatOptLang.toLowerCase(),
                ) !=
                "kilometrage";
      }),
    ];
    return filterOptions;
  }

  static countFilterResult() async {
    return 10;
  }
}
