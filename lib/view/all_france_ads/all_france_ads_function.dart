import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../model/filter_names.dart';
import '../../utils/utils.dart';

class AllFranceAdsFunction {
  static Future<int> getAllAdsNumber() async {
    String url = Utils.baseUrl + "/get_table.php";
    int quantity = 0;
    try {
      await http
          .post(
        Uri.parse(url),
        body: jsonEncode(
          {
            "filter": FilterNames.countAllFranceAds.name,
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
}
