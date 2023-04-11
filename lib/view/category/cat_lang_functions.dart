import 'dart:convert';
import 'dart:convert' as json;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../model/cat_lang.dart';
import '../../model/filter_names.dart';
import '../../utils/utils.dart';

class CatLangFunctions {
  static Future<List<CatLang>> getCats() async {
    List<CatLang> categories = [];
    String url = Utils.baseUrl + "/get_table.php";
    try {
      await http
          .post(
        Uri.parse(url),
        body: json.jsonEncode({"filter": FilterNames.getCatLang.name}),
      )
          .then((value) {
        if (value.statusCode == 200) {
          var jsonData = jsonDecode(value.body);
          categories =
              List.from(jsonData).map((e) => CatLang.fromJson(e)).toList();
        }
      });
    } catch (exception) {
      if (kDebugMode) {}
    }

    return categories;
  }

  Future<Map<String, dynamic>> getSubCat(CatLang catLang) async {
    List<CatLang> subCategories = [];
    int subTotal = 0;
    int quantity = 0;
    String url = Utils.baseUrl + "/get_table.php";
    try {
      await http
          .post(
        Uri.parse(url),
        body: json.jsonEncode(
          {
            "filter": FilterNames.getSubCatLang.name,
            "body": {
              "cat_lang": catLang.toJson(),
            },
          },
        ),
      )
          .then(
        (value1) async {
          if (value1.statusCode == 200) {
            var jsonData = jsonDecode(value1.body);
            subCategories = List.from(jsonData)
                .map(
                  (e) => CatLang.fromJson(e),
                )
                .toList();
            for (CatLang catLang in subCategories) {
              await http
                  .post(
                Uri.parse(url),
                body: json.jsonEncode(
                  {
                    "filter": FilterNames.getQuantityCatLang.name,
                    "body": {
                      "cat_lang": catLang.toJson(),
                    },
                  },
                ),
              )
                  .then(
                (value) {
                  if (value.statusCode == 200) {
                    quantity = List.from(
                      jsonDecode(value.body),
                    ).map((e) => e["number"] as int).first;
                    catLang.quantity = quantity;
                    subTotal += quantity;
                  }
                },
              );
            }
            return {
              'subCategory': subCategories,
              'total': subTotal,
              'quantity': quantity
            };
          }
        },
      );
    } catch (exception) {
      if (kDebugMode) {}
    }

    return {
      'subCategory': subCategories,
      'total': subTotal,
    };
  }

  static Future<int> getCatQuantity(CatLang catLang) async {
    String url = Utils.baseUrl + "/get_table.php";
    int quantity = 0;
    try {
      await http
          .post(
        Uri.parse(url),
        body: json.jsonEncode(
          {
            "filter": FilterNames.getQuantityCatLang.name,
            "body": {
              "cat_lang": catLang.toJson(),
            },
          },
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            quantity = List.from(
              jsonDecode(value.body),
            ).map((e) => e["number"] as int).first;
            quantity = quantity;
          }
        },
      );
    } catch (exception) {
      if (kDebugMode) {}
    }
    return quantity;
  }

  static String getAssetPath(String categoryName) {
    String images = '';
    switch (categoryName) {
      case 'ANIMAUX':
        images = 'images/cat_lang/145.jpg';
        break;
      case 'BEBE-PUERICULTURE':
        images = 'images/cat_lang/270.jpg';
        break;
      case 'DIVERS':
        images = 'images/divers.jpg';
        break;
      case 'EMPLOI':
        images = 'images/cat_lang/90.jpg';
        break;
      case 'IMMOBILIER':
        images = 'images/cat_lang/71.jpg';
        break;
      case 'JEUX-CULTURE-LOISIRS':
        images = 'images/cat_lang/180.jpg';
        break;
      case 'MAISON':
        images = 'images/maison.jpg';
        break;
      case 'MATERIEL PROFESSIONNEL':
        images = 'images/cat_lang/106.jpg';
        break;
      case 'MODE-BEAUTE-BIJOUX':
        images = 'images/mode.jpg';
        break;
      case 'MULTIMEDIA':
        images = 'images/multimedia.jpg';
        break;
      case 'RENCONTRE':
        images = 'images/cat_lang/188.jpg';
        break;
      case 'SERVICES':
        images = 'images/cat_lang/254.jpg';
        break;
      case 'VACANCES':
        images = 'images/vacances.jpg';
        break;
      case 'VEHICULES':
        images = 'images/cat_lang/81.jpg';
        break;

      default:
        images = 'images/logo.png';
    }

    return images;
  }
}
