// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../model/is_login.dart';

class InfoCompteController with ChangeNotifier, DiagnosticableTreeMixin {
  // int id_compte = 0;
  // ignore: non_constant_identifier_names
  Map<dynamic, dynamic> InfoGlobal = {
    'number': '0',
     "id_acc": "",
     "name": "",
     "first_name": "",
     "pseudo": "",
     "about_me": "",
     "email": "",
     "phone": "",
     "address": "",
     "postcode": "",
     "civility": "",
     "type": "",
     "city": "",
     "state": "",
     "credit": "",
     "ip": "",
     "comp_name": "",
     "comp_num": ""
  };

  void insertToInfoGlobal(String key, dynamic val) {
    InfoGlobal[key] = val;

    notifyListeners();
  }

  void adsNumber(String id, BuildContext context) async {

    String url = 'https://api.trocbuy.fr/flutter/duo_ads_number_compte.php';
    http.Response resp = await http.post(Uri.parse(url), body: {'id_acc': id});
    try {
      if (jsonDecode(resp.body)['number'] != null) {
        InfoGlobal['number'] = jsonDecode(resp.body)['number'];
      }

    } catch (e) {

    }

    notifyListeners();
  }

  void getInfoCompte(BuildContext context, http.Response response) {
    if (jsonDecode(response.body)['name'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['name'] = jsonDecode(response.body)['name'];
    }

    if (jsonDecode(response.body)['id_acc'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['id_acc'] = jsonDecode(response.body)['id_acc'];
    }

    if (jsonDecode(response.body)['pseudo'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['pseudo'] = jsonDecode(response.body)['pseudo'];
    }
    if (jsonDecode(response.body)['phone'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['phone'] = jsonDecode(response.body)['phone'];
    }
    if (jsonDecode(response.body)['address'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['address'] = jsonDecode(response.body)['address'];
    }
    if (jsonDecode(response.body)['city'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['city'] = jsonDecode(response.body)['city'];
    }

    if (jsonDecode(response.body)['postcode'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['postcode'] = jsonDecode(response.body)['postcode'];
    }
    if (jsonDecode(response.body)['type'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['type'] = jsonDecode(response.body)['type'];
    }
    if (jsonDecode(response.body)['state'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['state'] = jsonDecode(response.body)['state'];
    }
    if (jsonDecode(response.body)['about_me'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['aboutMe'] = jsonDecode(response.body)['about_me'];
    }
    if (jsonDecode(response.body)['first_name'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['first_name'] = jsonDecode(response.body)['first_name'];
    }

    if (jsonDecode(response.body)['comp_name'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['comp_name'] = jsonDecode(response.body)['comp_name'];
    }
    if (jsonDecode(response.body)['comp_num'] != null) {
      Provider.of<InfoCompteController>(context, listen: false)
          .InfoGlobal['comp_num'] = jsonDecode(response.body)['comp_num'];
    }

    Provider.of<InfoCompteController>(context, listen: false)
        .InfoGlobal['number'] = '0';

    IsLogin.state = true;

    notifyListeners();
  }
}
