import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../../model/ad.dart';
import '../../../model/county.dart';
import '../../../model/filter_names.dart';
import '../../../model/region.dart';
import '../../../res/strings.dart';
import '../../../utils/utils.dart';

class AdDetailsFunctions {
  static callNumber(String num) async {
    Uri  uri = Uri.parse('tel:+33'+ num.replaceAll('+33', ''));

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ...$uri';
    }
  }

  static textAdvertiser(String phone) async {
    // Android
    Uri  uri = Uri.parse('sms:+33${phone.replaceAll('+33', '')} ?body=${Strings.kTextMessage}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // iOS
      Uri uri = Uri.parse('sms:+33+$phone}');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Impossible de lancer $uri';
      }
    }
  }

  static emailAdvertiser(String email, String title) async {
    // Android
    Uri uri = Uri.parse('mailto:' + email + '?subject=${Strings.kAd}: ' + title);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // iOS
      Uri uri = Uri.parse('mailto:'+email);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'D envoyer l annonce $uri';
      }
    }
  }

  static Future<int> getAdsOfAuthorQuantity(Ad ad) async {
    String url = Utils.baseUrl + "/get_table.php";
    int quantity = 0;

    try {
      await http
          .post(
        Uri.parse(url),
        body: jsonEncode(
          {
            "filter": FilterNames.countAuthorAds.name,
            "body": {
              "ad": ad.toJson(),
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

  static Future<int> getAdsOfCountyQuantity(County county) async {
    String url = Utils.baseUrl + "/get_table.php";
    int quantity = 0;

    try {
      await http
          .post(
        Uri.parse(url),
        body: jsonEncode(
          {
            "filter": FilterNames.countCountyAds.name,
            "body": {
              "county": county.toJson(),
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

  static Future<int> getAdsOfRegionQuantity(Region region) async {
    String url = Utils.baseUrl + "/get_table.php";
    int quantity = 0;

    try {
      await http
          .post(
        Uri.parse(url),
        body: jsonEncode(
          {
            "filter": FilterNames.countRegionAds.name,
            "body": {
              "region": region.toJson(),
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
}
