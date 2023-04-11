// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:http/http.dart' as http;
// import 'package:trocbuy/global_functions/ads_functions.dart';
// import 'package:trocbuy/res/strings.dart';
// import 'package:trocbuy/utils/utils.dart';

// import '../model/ad.dart';
// import '../model/ads_favorite.dart';
// import '../model/filter_names.dart';

// class FavoriteFunctions {
//   static List adFavorites = [
//     '',
//   ];

//   //vérifions si l annonce est dans les favoris
//   Future<bool> checkPresenceInFavorites(int idAd) async {
//     bool presence = false;
//     if (adFavorites.isNotEmpty) {
//       presence = adFavorites.contains(idAd);
//     }
//     return presence;
//   }

//   Future<List> getListFavorite(String id_acc) async {
//     String url = "https://api.trocbuy.fr/flutter//duo_get_favorite.php";
//     AdsFavorite.info['id_acc'] = id_acc;
//     var response = await http.post(Uri.parse(url), body: AdsFavorite.info);
//     print(jsonDecode(response.body.toString()));
//     return jsonDecode(response.body.toString());
//   }

//   setListFavorite(String id_acc, String id_ad) async {
//     String url = "${Utils.baseUrl}/duo_add_favorite.php";
//     AdsFavorite.info['id_acc'] = id_acc;
//     AdsFavorite.info['id_ad'] = id_ad.toString();

//     var response = await http.post(Uri.parse(url), body: AdsFavorite.info);
//     if (response.statusCode != 200) {
//       EasyLoading.showError(Strings.kError);
//     } else {
//       adFavorites.add(id_ad);
//     }
//   }

//   deleteFavorite(String id_acc, String id_ad) async {
//     String url = "${Utils.baseUrl}/duo_delete_favorite.php";
//     AdsFavorite.info['id_acc'] = id_acc;
//     AdsFavorite.info['id_ad'] = id_ad.toString();
//     var response = await http.post(Uri.parse(url), body: AdsFavorite.info);
//     if (response.statusCode != 200) {
//       EasyLoading.showError(Strings.kError);
//     } else {
//       adFavorites.removeWhere((element) => element == id_ad);
//       if (kDebugMode) {}
//     }
//   }

//   Future<List<Ad>> storedIdAdSelection() async {
//     List favorites = [];
//     List<Ad> ads = [];
//     try {
//       for (var row in adFavorites) {
//         String idAd = row;
//         Ad ad = (await AdsFunctions().getAdsByParameters(
//           FilterNames.singleAd.name,
//           {"id_ad": idAd},
//         ))
//             .first;
//         ads.add(ad);
//       }
//     } catch (e) {
//       if (kDebugMode) {}
//     }

//     return ads;
//   }
// }
