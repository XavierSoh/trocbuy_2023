// ignore_for_file: void_checks, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trocbuy/view/favorite/provider/provider_favorite.dart';
import 'package:trocbuy/view/login_page/provider/info_compte.dart';

import '../model/cat_lang.dart';
import '../model/county.dart';
import '../model/region.dart';
import '../view/home/home.dart';

class InitData {
  BuildContext context;

  InitData({required this.context});

  static late SharedPreferences prefs;
  static bool initialised = false;

  Future<Object>? initData() async {
    prefs = await SharedPreferences.getInstance();

    await CatLang.setCatsLangList();
    await County.getCounties();
    if (prefs.getString('id_acc') != null) {
      var response = await http.post(
          Uri.parse(
            "https://api.trocbuy.fr/flutter/duo_getinfo_profil.php",
          ),
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          encoding: Encoding.getByName('utf-8'),
          body: {'id_acc': prefs.getString('id_acc')});

      Provider.of<InfoCompteController>(context, listen: false)
          .getInfoCompte(context, response);
      Provider.of<InfoCompteController>(context, listen: false)
          .adsNumber(prefs.getString('id_acc')!, context);
      await Provider.of<FavoriteFunctions>(context, listen: false)
          .getListFavorite();
    }

    return await Region.setRegion().then((value) {
      initialised = true;
      //if (initialised) {

      return Future.value(
        const Home(),
      );

      //}
    });
  }
}
