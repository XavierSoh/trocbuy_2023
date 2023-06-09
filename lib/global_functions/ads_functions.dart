import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trocbuy/model/ad_option1.dart';
import 'package:trocbuy/providers/ad_sort_by_provider.dart';
import 'package:trocbuy/providers/search_model_prov.dart';
import 'package:trocbuy/view/arround_me_ads/around_me_functions.dart';

import '../constants/constants.dart';
import '../model/ad.dart';
import '../model/ad_image_model.dart';
import '../model/ad_option2.dart';
import '../model/ad_option3.dart';
import '../model/ad_options.dart';
import '../utils/utils.dart';

class AdsFunctions {
  ///******************************GET PRIMARY ADS OR RECENT AD*********************************
  static Future<List<Ad>> getAds(String type,
      {Map<String, dynamic>? body}) async {
    List<Ad> ads = [];
    try {
      String url = Utils.baseUrl + "/get_table.php";
      await http
          .post(
        Uri.parse(url),
        body: jsonEncode({"filter": type, "body": body}),
      )
          .then(
        (response) {
          if (response.statusCode == 200) {
            var jsonResponse = jsonDecode(response.body);
            //var jsonResponse = json.decode(utf8.decode(response.bodyBytes));

            ads = List.from(jsonResponse).map((e) => Ad.fromJson(e)).toList();

            return ads;
          } else {
            //TODO:shos error alert dialog
          }
        },
      ).timeout(
        const Duration(seconds: 300),
        onTimeout: () {},
      );
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
    return ads;
  }

  ///******************************GET FEATURES, AUTHOR/ADVERTISER S ADS*********************************
  Future<List<Ad>> getAdsByParameters(
      String type, Map<String, dynamic> body) async {
    List<Ad> ads = [];
    try {
      String url = Utils.baseUrl + "/get_table.php";
      await http
          .post(
            Uri.parse(url),
            body: jsonEncode(
              {"filter": type, "body": body},
            ),
          )
          .then(
            (response) {
              if (response.statusCode == 200) {
                var jsonResponse = jsonDecode(response.body);

                ads =
                    List.from(jsonResponse).map((e) => Ad.fromJson(e)).toList();
              } else {}
            },
          )
          .timeout(
            const Duration(seconds: 300),
            onTimeout: () {},
          )
          .onError(
            (error, stackTrace) {
              if (kDebugMode) {
                print(error);
                print(stackTrace);
              }
            },
          );
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
    return ads;
  }

  Future<List<Map<String, dynamic>>> getJsonAdsByParameters(
      String type, Map<String, dynamic> body) async {
    List jsonResponse = [];
    try {
      String url = Utils.baseUrl + "/get_table.php";
      await http
          .post(
            Uri.parse(url),
            body: jsonEncode(
              {"filter": type, "body": body},
            ),
          )
          .then(
            (response) {
              print('body parser...');
              print(response.body);
              if (response.statusCode == 200) {
                jsonResponse = jsonDecode(response.body);
                print('Bodyyy>>>>> ${jsonResponse}');
              } else {}
            },
          )
          .timeout(
            const Duration(seconds: 300),
            onTimeout: () {},
          )
          .onError(
            (error, stackTrace) {
              if (kDebugMode) {
                print(error);
                print(stackTrace);
              }
            },
          );
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
    return List.from(jsonResponse).map((e) {
      e = e as Map<String, dynamic>;
      return e;
    }).toList();
  }

  Future<List<Ad>> getAdsByPosition(
      String type, double distance, String orderBy) async {
    Position position = await AroundMeFunctions.determinePosition();
    Map<String, dynamic> body = {
      "location": {
        "latitude": position.latitude,
        "longitude": position.longitude
      },
      "distance": distance,
      "order_by": orderBy
    };
    List<Ad> ads = [];
    try {
      String url = Utils.baseUrl + "/get_table.php";
      await http
          .post(
        Uri.parse(url),
        body: jsonEncode(
          {"filter": type, "body": body},
        ),
      )
          .then(
        (response) {
          if (response.statusCode == 200) {
            var jsonResponse = jsonDecode(response.body);

            ads = List.from(jsonResponse).map((e) => Ad.fromJson(e)).toList();
            ads[10].framed = 1;
            ads[3].framed = 1;
            ads[16].framed = 1;
            ads[23].framed = 1;
          } else {}
        },
      ).timeout(
        const Duration(seconds: 300),
        onTimeout: () {},
      );
    } catch (exception) {
      if (kDebugMode) {}
    }
    return ads;
  }

  ///SEARCH RESULTS
  Future<List<Ad>> getSearchResults(BuildContext context) async {
    final search = context.read<SearchModelProv>().searchModel;
    List<Ad> ads = [];
    search.searchText ??= search.searchText?.trim();
    try {
      String url = Utils.baseUrl + "/xav_search.php";
      await http
          .post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: jsonEncode(
          {
            "body": search.toJson(),
            "order_by": context.read<AdSortByProvider>().adSortBy.name,
          },
        ),
      )
          .then(
        (response) {
          if (response.statusCode == 200) {
            print("REsponse >>>${response.body}");
            var jsonResponse = jsonDecode(response.body);

            ads += List.from(jsonResponse).map((e) => Ad.fromJson(e)).toList();
          } else {}
        },
      ).timeout(
        const Duration(seconds: 300),
        onTimeout: () {},
      );
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error >>>$exception");
        print("Trzce >>>$trace");
      }
    }

    return ads;
  }

  ///******************************GET IMAGES FROM SINGLE AD*********************************
  static Future<List<AdImageModel>> getAdImages(String type, int idAd) async {
    List<AdImageModel> adImages = [];
    try {
      String url = Utils.baseUrl + "/get_table.php";
      await http
          .post(
        Uri.parse(url),
        body: jsonEncode(
          {"filter": type, "id_ad": idAd},
        ),
      )
          .then(
        (response) {
          if (response.statusCode == 200) {
            var jsonResponse = jsonDecode(response.body);
            if (kDebugMode) {}
            adImages = List.from(jsonResponse)
                .map(
                  (e) => AdImageModel.fromJson(e),
                )
                .toList();
          } else {
            //TODO:shows error alert dialog
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
    return adImages;
  }

  ///******************************GENRATE URL FROM AD PICTURE_NAME *********************************
  static String generateImageUrlFromAd(String pictureName) {
    String url = "";

    if (pictureName.isNotEmpty) {
      switch (pictureName.indexOf('http')) {
        case -1:
          url = Utils.basicPhotoUrl + "/" + pictureName;
          break;

        default:
          {
            url = pictureName;
          }
      }
    } else {
      url = Utils.basicPhotoUrl + '/camera.png';
    }
    return url;
  }

  static void adChangeState(String idAd, String state) async {
    String url = Utils.baseUrl + '/duo_state_ads_change.php';

    Map<String, String> body = {
      'id_ad': idAd,
      'state': state,
    };

    http.Response response = await http.post(Uri.parse(url), body: body);
    if (kDebugMode) {}
  }

  ///**************GET LINK FROM AD FOR SHARE ******************
  static Future<String> getLink(Ad ad) async {
    String category = "";
    String baseUrl = 'https://trocbuy.fr/en/ad/';
    String baseLink = 'https://api.trocbuy.fr/flutter/xav_ads_link.php';
    final url = '$baseLink?id_county=${ad.idCounty}&id_reg=${ad.idReg}';
    var response = await http.get(Uri.parse(url));
    var jsonResponse = jsonDecode(response.body);
    final nameCountyLang =
        kFormatLink(jsonResponse['name_county_lang'].toString());
    final nameReg = kFormatLink(jsonResponse['name_reg_lang'].toString());

    String url2 = "https://api.trocbuy.fr/flutter/get_table.php";

    String link =
        '$baseUrl$nameReg-$nameCountyLang-${kFormatLink(category)}-${kFormatLink(ad.title!)}-${ad.idAd}';

    return link;
  }

  ///****************************** GET AD OPTIONS *********************************
  static Future<List> getAdOptions(
      String type, Map<String, dynamic> body) async {
    List options = [];
    try {
      const String url = Utils.baseUrl + "/get_table.php";

      await http
          .post(
        Uri.parse(url),
        body: jsonEncode(
          {"filter": type, "body": body},
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            var jsonResponse = jsonDecode(value.body);
            options = List.from(jsonResponse)
                .map(
                  (e) => AdOptions(
                    adOptions1: AdOption1.fromJson(e),
                    adOptions2: AdOption2.fromJson(e),
                    adOptions3: AdOption3.fromJson(e),
                  ),
                )
                .toList();
          }
        },
      );
    } catch (exception) {
      if (kDebugMode) {}
    }

    return options;
  }
}
