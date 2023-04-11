import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../global_functions/ads_functions.dart';
import '../../../model/ad.dart';
import '../../../model/ads_favorite.dart';
import '../../../model/filter_names.dart';
import '../../../res/strings.dart';

class FavoriteFunctions with ChangeNotifier {
  List adFavorites = [];

  SharedPreferences? prefs;

  //vérifions si l annonce est dans les favoris
  Future<bool> checkPresenceInFavorites(int idAd) async {
    bool presence = false;
    if (adFavorites.isNotEmpty) {
      presence = adFavorites.contains(idAd);
    }
    return presence;
  }

  Future<void> getListFavorite() async {
    prefs = await SharedPreferences.getInstance();
    String url = "https://api.trocbuy.fr/flutter/duo_get_favorite.php";

    var response = await http.post(Uri.parse(url), body: {'id_acc': prefs!.getString('id_acc')});

    adFavorites = jsonDecode(response.body.toString());
    print('get $adFavorites');
    notifyListeners();
  }

  setListFavorite(BuildContext context, String idAd) async {
    try {
      prefs = await SharedPreferences.getInstance();
      String url = "https://api.trocbuy.fr/flutter/duo_add_favorite.php";
      AdsFavorite.info['id_acc'] = prefs!.getString('id_acc');
      AdsFavorite.info['id_ad'] = idAd.toString();

      var response = await http.post(Uri.parse(url), body: AdsFavorite.info);
      if (response.statusCode != 200) {
        EasyLoading.showError(Strings.kError);
      } else {
        Provider.of<FavoriteFunctions>(context, listen: false).adFavorites.add(idAd);

        print('set : ${Provider.of<FavoriteFunctions>(context, listen: false).adFavorites}');
      }
      notifyListeners();
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
  }

  deleteFavorite(BuildContext context, String idAd) async {
    prefs = await SharedPreferences.getInstance();
    String url = "https://api.trocbuy.fr/flutter/duo_delete_favorite.php";

    AdsFavorite.info['id_acc'] = prefs!.getString('id_acc');
    AdsFavorite.info['id_ad'] = idAd.toString();
    var response = await http.post(Uri.parse(url), body: AdsFavorite.info);
    if (response.statusCode != 200) {
      EasyLoading.showError(Strings.kError);
    } else {
      Provider.of<FavoriteFunctions>(context, listen: false)
          .adFavorites
          .removeWhere((element) => element == idAd);
      if (kDebugMode) {}
    }
    notifyListeners();
  }

  Future<List<Ad>> storedIdAdSelection(BuildContext context, List fvr) async {
    List<Ad> ads = [];
    print('get ${Provider.of<FavoriteFunctions>(context, listen: false).adFavorites}');
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
