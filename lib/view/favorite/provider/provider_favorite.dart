import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trocbuy/model/database_helper.dart';

import '../../../global_functions/ads_functions.dart';
import '../../../model/ad.dart';
import '../../../model/ads_favorite.dart';
import '../../../model/filter_names.dart';

class FavoriteFunctions with ChangeNotifier {
  List<Ad> adFavorites = [];

  SharedPreferences? prefs;

  //vérifions si l annonce est dans les favoris
  Future<bool> checkPresenceInFavorites(int idAd) async {
    bool presence = false;
    if (adFavorites.isNotEmpty) {
      presence = adFavorites
          .where((element) => element.idAd == idAd)
          .toList()
          .isNotEmpty;
    }
    return presence;
  }

  Future<void> getListFavorite() async {
    try {
      prefs = await SharedPreferences.getInstance();

      var response = await DatabaseHelper.instance.queryAll();
      print('ResponseQuery;   ${response[0]}');

      adFavorites = response.map((e) {
        print("GGGEEEEE ${e}");
        return Ad.fromJson(jsonDecode(e[DatabaseHelper.columnName]));
      }).toList();
      if (kDebugMode) {
        print('get>>>>>>. $adFavorites');
      }
      notifyListeners();
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
  }

  setListFavorite(BuildContext context, Ad ad) async {
    try {
      prefs = await SharedPreferences.getInstance();
      AdsFavorite.info['id_acc'] = prefs!.getString('id_acc');
      AdsFavorite.info['id_ad'] = ad.idAd.toString();

      Provider.of<FavoriteFunctions>(context, listen: false)
          .adFavorites
          .add(ad);
      print(
          'set : ${Provider.of<FavoriteFunctions>(context, listen: false).adFavorites}');

      notifyListeners();
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
  }

  deleteFavorite(BuildContext context, Ad ad) async {
    prefs = await SharedPreferences.getInstance();
    try {
      AdsFavorite.info['id_acc'] = prefs!.getString('id_acc');
      AdsFavorite.info['id_ad'] = ad.idAd.toString();
      Provider.of<FavoriteFunctions>(context, listen: false)
          .adFavorites
          .removeWhere((element) => element == ad);

      Provider.of<FavoriteFunctions>(context, listen: false).notifyListeners();
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
  }

  Future<List<Ad>> storedIdAdSelection(BuildContext context, List fvr) async {
    List<Ad> ads = [];
    print(
        'get FVR ${Provider.of<FavoriteFunctions>(context, listen: false).adFavorites}');
    try {
      for (var row in fvr) {
        String idAd = row;
        Ad ad = (await AdsFunctions().getAdsByParameters(
          FilterNames.singleAd.name,
          {"id_ad": idAd},
        ))
            .first;
        ads.add(ad);
      }
    } catch (e) {
      if (kDebugMode) {}
    }

    return ads;
  }
}
