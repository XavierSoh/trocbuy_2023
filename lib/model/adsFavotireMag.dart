// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trocbuy/view/login_page/provider/info_compte.dart';

// import '../utils/utils.dart';
// import 'ads_favorite.dart';

// class adsFavoriteMag {
//   static List adsFavorite = [];
//   SharedPreferences? prefs;

//   Future<List> getListFavorite() async {
//     prefs = await SharedPreferences.getInstance();
//     String url = "https://api.trocbuy.fr/flutter/duo_get_favorite.php";

//     var response = await http
//         .post(Uri.parse(url), body: {'id_acc': prefs!.getString('id_acc')});

//     return jsonDecode(response.body.toString());
//   }

//   setListFavorite(String id_acc, String id_ad) async {
//     String url = "${Utils.baseUrl}/duo_add_favorite.php";
//     AdsFavorite.info['id_acc'] = id_acc;
//     AdsFavorite.info['id_ad'] = id_ad;

//     var response = await http.post(Uri.parse(url), body: AdsFavorite.info);
//     if (response.body == null) {
//     } else {
//       adsFavorite.add(id_ad);
//     }
//   }

//   deleteFavorite(String id_acc, String id_ad) async {
//     String url = "${Utils.baseUrl}/duo_delete_favorite.php";
//     AdsFavorite.info['id_acc'] = id_acc;
//     AdsFavorite.info['id_ad'] = id_ad;
//     var response = await http.post(Uri.parse(url), body: AdsFavorite.info);
//     if (response.body == null) {
//       EasyLoading.showError('Erreur !');
//     } else {
//       adsFavorite.removeWhere((element) => element == id_ad);
//     }
//   }
// }
