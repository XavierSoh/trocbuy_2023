import 'dart:convert';

import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/Categories/cats_class.dart';
import '../model/Categories/cats_opts_class.dart';
import '../model/Categories/regs_class.dart';
import '../model/Informations2.dart';
import '../model/ad.dart';
import '../model/imagesSlides.dart';
import '../model/informations.dart';
import '../model/informations3.dart';
import '../model/informations4.dart';
import '../model/region.dart';
import '../model/regions2.dart';
import '../view/components/style1.dart';

const kTitle = 'trocbuy';
const String kAllFranceText = 'Toute la France';
const String kArroundMeText = 'Près de chez moi';

List<Widget> kRegionListChildren = Regions2.regionList
    .map(
      (e) => Center(
        child: Text(
          e,
        ),
      ),
    )
    .toList();

List<Widget> listAdsCats = AdsCats.adsCats.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

//---------------------------------------
List<Widget> subCatsList0 = Cat0Animaux.cat0Animaux.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList1 = Cat1Bebe.cat1Bebe.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList2 = Cat2Emploi.cat2Emploi.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList3 = Cat3Immobiler.cat3Immobiler.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList4 = Cat4Multimedia.cat4Multimedia.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList5 = Cat5JeuxCulture.cat5JeuxCulture.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList6 = Cat6Maison.cat6Maison.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList7 = Cat7ModeBeaute.cat7ModeBeaute.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList8 = Cat8MaterialPro.cat8MaterialPro.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList9 = Cat9Rencontre.cat9Rencontre.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList10 = Cat10Service.cat10Service.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList11 = Cat11Vacances.cat11Vacances.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList12 = Cat12Vehicules.cat12Vehicules.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsList13 =
    Cat13DiversAutres.cat13DiversAutres.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
//---------------------------------------
//---------------------------------------
List<Widget> listAdsRegions = Region.regions.map((e) {
  return DropdownStyle1(
    getKey: e.nameRegLang,
  );
}).toList();
List<Widget> subRegsList0 = Reg0Auvergne.reg0Auvergne.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList1 = Reg1Bourgogne.reg1Bourgogne.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList2 = Reg2Bretagne.reg2Bretagne.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList3 = Reg3Centre.reg3Centre.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList4 = Reg4Corse.reg4Corse.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList5 = Reg5Grand.reg5Grand.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList6 = Reg6Hauts.reg6Hauts.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList7 = Reg7Ile.reg7Ile.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList8 = Reg8Normandie.reg8Normandie.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList9 = Reg9Nouvelle.reg9Nouvelle.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList10 = Reg10Occitanie.reg10Occitanie.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList11 = Reg11Pays.reg11Pays.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList12 = Reg12Provence.reg12Provence.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList13 = Reg13Guadeloupe.reg13Guadeloupe.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList14 = Reg14Martinique.reg14Martinique.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList15 = Reg15Guyane.reg15Guyane.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList16 = Reg16Reunion.reg16Reunion.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList17 = Reg17Mayotte.reg17Mayotte.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subRegsList18 = Reg18Autre.reg18Autre.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
//---------------------------------------

List<Widget> subCatsListAdsCats12Vehcules4Motos0Type =
    AdsCats12Vehcules4Motos0Type.adsCats12Vehcules4Motos0Type.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsListAdsCats12Vehcules4Motos1Marque =
    AdsCats12Vehcules4Motos1Marque.adsCats12Vehcules4Motos1Marque.entries
        .map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules0Annee =
    AdsCats12Cat0Annee.adsCats12Cat0Annee.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules4Motos3Cylindree =
    AdsCats12Vehcules4Motos3Cylindree.adsCats12Vehcules4Motos3Cylindree.entries
        .map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules1Permis =
    AdsCats12Vehcules1Permis.adsCats12Vehcules1Permis.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules2Couleur =
    AdsCats12Vehcules2Couleur.adsCats12Vehcules2Couleur.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules3Marque =
    AdsCats12Vehcules3Marque.adsCats12Vehcules3Marque.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules7Voiture1Type =
    AdsCats12Vehcules7Voiture1Type.adsCats12Vehcules7Voiture1Type.entries
        .map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules4Energie =
    AdsCats12Vehcules4Energie.adsCats12Vehcules4Energie.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules5Boite =
    AdsCats12Vehcules5Boite.adsCats12Vehcules5Boite.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules6PlacesOrPortes =
    AdsCats12Vehcules6Portes.adsCats12Vehcules6Portes.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats12Vehcules8Nautisme =
    AdsCats12Vehcules8Nautisme.adsCats12Vehcules8Nautisme.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats10Service1Prestations =
    AdsCats10Service1Prestations.adsCats10Service1Prestations.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsListAdsCats3Immobilier0Interieur =
    AdsCats3Immobilier0Interieur.adsCats3Immobilier0Interieur.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();
List<Widget> subCatsListAdsCats3Immobilier1Type =
    AdsCats3Immobilier1Type.adsCats3Immobilier1Type.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats3Immobilier1TypeVente =
    AdsCats3Immobilier1TypeVente.adsCats3Immobilier1TypeVente.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

List<Widget> subCatsListAdsCats0Animaux1Hamsters =
    AdsCats0Animaux1Hamsters.adsCats0Animaux1Hamsters.entries.map((e) {
  return DropdownStyle1(
    getKey: e.key,
  );
}).toList();

//INFORMATIONS POUR ANNONCES Details
Future kInfosList(String url,
    [String? url2, String? url3, String? url4]) async {
  var getInfoValue = await http.post(Uri.parse(url));
  var getInfo2Value = await http.post(Uri.parse(url2!));
  var getInfo3Value = await http.post(Uri.parse(url3!));
  var getInfo4Value = await http.post(Uri.parse(url4!));

  var responseInfo = json.decode(getInfoValue.body);
  var responseInfo2 = jsonDecode(getInfo2Value.body);

  var responseInfo3 = jsonDecode(getInfo3Value.body);

  var responseInfo4 = jsonDecode(getInfo4Value.body);

  Informations _infoS = Informations(
      responseInfo[0]['id_ad'],
      responseInfo[0]['id_reg'],
      responseInfo[0]['id_county'],
      responseInfo[0]['id_cat'],
      responseInfo[0]['postcode'],
      responseInfo[0]['status'],
      responseInfo[0]['type'],
      responseInfo[0]['title'],
      responseInfo[0]['text'],
      responseInfo[0]['price'],
      responseInfo[0]['id_acc'],
      responseInfo[0]['date'],
      responseInfo[0]['heure'],
      responseInfo[0]['urgent'],
      responseInfo[0]['lat'],
      responseInfo[0]['lng'],
      responseInfo[0]['comment_total'],
      responseInfo[0]['comment_average'],
      responseInfo[0]['framed'],
      responseInfo[0]['auteur'],
      responseInfo[0]['phone'],
      responseInfo[0]['phone_hidden'],
      responseInfo[0]['visit_num'],
      responseInfo[0]['date_last_visit'],
      responseInfo[0]['heure_last_visit'],
      responseInfo[0]['picture_num'],
      responseInfo[0]['picture_name'],
      responseInfo[0]['categorie'],
      responseInfo[0]['nomeField'],
      responseInfo[0]['field'],
      responseInfo[0]['nomoption1'],
      responseInfo[0]['uniteoption1'],
      responseInfo[0]['option1'],
      responseInfo[0]['quantite'],
      responseInfo[0]['email'],
      responseInfo[0]['city']);

  List<Informations2> myInfos2 = [];
  for (var resp2 in responseInfo2) {
    Informations2 response2 =
        Informations2(resp2['nomoption2'], resp2['option2'], resp2['quantite']);
    myInfos2.add(response2);
  }
  List<Informations3> myInfos3 = [];
  for (var resp3 in responseInfo3) {
    Informations3 response3 = Informations3(
        resp3['nomoption1'], resp3['uniteoption1'], resp3['option1']);
    myInfos3.add(response3);
  }
  List<Informations4> myInfos4 = [];
  for (var resp4 in responseInfo4) {
    Informations4 response4 = Informations4(
        resp4['nomoption1'], resp4['uniteoption1'], resp4['option1']);
    myInfos4.add(response4);
  }

  List generalInfos = [_infoS, myInfos2, myInfos3, myInfos4];

  return generalInfos;
}

String kFormatLink(String link) {
  return removeDiacritics(link
          .replaceAll(RegExp(' +'), '-')
          .replaceAll('/', '-')
          .replaceAll('²', '')
          .replaceAll(' ', ''))
      .replaceAll(',', '')
      .replaceAll('\'', '-');
}

Future<List<ImagesSlides>> kImage0(String imageUrl) async {
  var getImageValue = await http.get(Uri.parse(imageUrl));
  var responseImage = json.decode(getImageValue.body);

  List<ImagesSlides> ims = [];

  for (var im in responseImage) {
    ImagesSlides _image = ImagesSlides(
      im['id_ad'],
      im['id_ima'],
      im['name'],
    );
    ims.add(_image);
  }

  return ims;
}

Future<ImagesSlides> kImage(String imageUrl, int index) async {
  var getImageValue = await http.get(Uri.parse(imageUrl));
  var responseImage = json.decode(getImageValue.body);

  ImagesSlides _image = ImagesSlides(
    responseImage[index]['id_ad'],
    responseImage[index]['id_ima'],
    responseImage[index]['picture_name'],
    responseImage[index]['price'],
    responseImage[index]['city'],
    responseImage[index]['title'],
  );
  return _image;
}

Future<Ad> futureAds(
  int index,
) async {
  // nbre = await quantite();
  http.Response response = await http
      .get(Uri.parse('https://api.trocbuy.fr/flutter/selection_recentes.php'));
  var jsonData = json.decode(response.body);
  Ad premiums = Ad(
      /*
    jsonData[index]['picture_name'],
    jsonData[index]['title'],
    jsonData[index]['city'],
    jsonData[index]['text'],
    jsonData[index]['pictures_num'],
    jsonData[index]['price'],
    jsonData[index]['date'],
    jsonData[index]['heure'],
    jsonData[index]['id_ad'],
    jsonData[index]['nbre'],*/
      );
  return premiums;
}

Future<Ad> futureAdsFrance(
  int index,
) async {
  // nbre = await quantite();
  http.Response response = await http.get(
      Uri.parse('https://api.trocbuy.fr/flutter/duo_selection_all_france.php'));
  var jsonData = json.decode(response.body);
  Ad premiums = Ad(
      /*
    jsonData[index]['picture_name'],
    jsonData[index]['title'],
    jsonData[index]['city'],
    jsonData[index]['text'],
    jsonData[index]['pictures_num'],
    jsonData[index]['price'],
    jsonData[index]['date'],
    jsonData[index]['heure'],
    jsonData[index]['id_ad'],
    jsonData[index]['nbre'],*/
      );
  return premiums;
}

Future<Ad> futureAdsRegion(int index, String region) async {
  // nbre = await quantite();
  Map<String, String> body = {'reg': region};
  http.Response response = await http.post(
      Uri.parse('https://api.trocbuy.fr/flutter/duo_selection_region.php'),
      body: body);
  var jsonData = json.decode(response.body);
  Ad premiums = Ad(
      /*
    jsonData[index]['picture_name'] ?? null,
    jsonData[index]['title'],
    jsonData[index]['city'],
    jsonData[index]['text'],
    jsonData[index]['pictures_num'],
    jsonData[index]['price'],
    jsonData[index]['date'],
    jsonData[index]['heure'],
    jsonData[index]['id_ad'],
    jsonData[index]['nbre'],*/
      );
  return premiums;
}

Future<Ad> futureAdsArround(int index, String region) async {
  // nbre = await quantite();
  Map<String, String> body = {'region': region};
  http.Response response = await http.post(
      Uri.parse('https://api.trocbuy.fr/flutter/duo_selection_arround.php'),
      body: body);
  var jsonData = json.decode(response.body);
  Ad premiums = Ad(
      /*
    jsonData[index]['picture_name'] ?? null,
    jsonData[index]['title'],
    jsonData[index]['city'],
    jsonData[index]['text'],
    jsonData[index]['pictures_num'],
    jsonData[index]['price'],
    jsonData[index]['date'],
    jsonData[index]['heure'],
    jsonData[index]['id_ad'],
    jsonData[index]['nbre'],*/
      );
  return premiums;
}

Future<Ad?> futureAdsCategories(
    int index, String categories, BuildContext context) async {
  // nbre = await quantite();
  Map<String, String> body = {'catg': categories};

  var response = await http
      .post(
          Uri.parse('https://api.trocbuy.fr/flutter/duo_selection_categories.php'),
          body: jsonEncode(body))
      .then(
    (value) {
      if (value.statusCode == 200) {
        var jsonData = jsonDecode(value.body);
        /*   Ads premiums = Ads(
          jsonData[index]['picture_name'],
          jsonData[index]['title'],
          jsonData[index]['city'],
          jsonData[index]['text'],
          jsonData[index]['pictures_num'],
          jsonData[index]['price'],
          jsonData[index]['date'],
          jsonData[index]['heure'],
          jsonData[index]['id_ad'],
          jsonData[index]['nbre'],
        );*/

      }
    },
  ).timeout(Duration(seconds: 100), onTimeout: () async {});
}

BoxDecoration kDecorationwith1 =
    BoxDecoration(border: Border.all(color: Colors.black26, width: 1));

Future<Ad> kFutureAds(int index, int urlNumber, List<String> urls,
    [String? nomCategorie]) async {
  var response = await http.get(Uri.parse(urls[urlNumber]));
  var jsonData = json.decode(response.body);
  Ad premiums = Ad(
      /* jsonData[index]['picture_name'],
      jsonData[index]['title'],
      jsonData[index]['city'],
      jsonData[index]['text'],
      jsonData[index]['pictures_num'],
      jsonData[index]['price'],
      jsonData[index]['date'],
      jsonData[index]['heure'],
      jsonData[index]['id_ad'],
      jsonData[index]['nbre'],
      nomCategorie*/
      );
  return premiums;
}

class IsLogin {
  static bool state = false;
}

class CompteInformation {
  static var id_acc;
  static Map info = {
    'reg': '',
    'id_county': '',
    'id_cat': '',
    'comp_name': '',
    'comp_num': '',
    'civility': '',
    'name': '',
    'first_name': '',
    'pseudo': '',
    'pseudo_display': '',
    'address': '',
    'postcode': '',
    'city': '',
    'phone': '',
    'email': '',
    'pas': '',
    'type': '',
    'state': ''
  };
}

class PictureNum {
  static int number = 1;
}

class AdsInformation {
  static var id_ad;
  static Map<dynamic, dynamic> info = {
    'email': '',
    'password': '',
    'city': '',
    'name': '',
    'phone': '',
    'phone_hidden': '',
    'ip': '',
    'pictures_num': '',
    'pictures_pack': '',
    'last_visit': '',
    'lang': 'fr',
    'title': '',
    'text': '',
    'price': '',
    'adress': '',
    'date': '',
    'postcode': '',

    //"pas": '',
    'id_reg': '',
    'id_county': '',
    'id_cat': '',
    'type': '',
    'state': '',

    // publish Screen 01
    'id_field': '21',
    'value': '',
    //

    'video': '',
    'status': '',
    'video_num': '',

    'picture_num': '',
    'lat': '',
    'lng': '',

    'top': '',
    'top_days': '',
    'top_time': '',
    'urgent': '',
    'urgent_days': '',
    'urgent_time': '',
    'framed': '',
    'framed_days': '',
    'framed_time': '',
    'premium': '',
    'premium_days': '',
    'premium_time': '',
  };
}

class AdsMoreInfo {
  static var idAd;
  static Map<String, dynamic> adsMoreInfoField = {};
}

class AdsInformationPhoto {
  static var id_ad;
  static Map<String, dynamic> picture = {'image': '', 'name': '', 'id_ad': ''};
}

class Informationlogin {
  static Map<dynamic, dynamic> info = {
    'email': '',
    'password': '',
    'id_acc': '',
  };
}

class UpdatePassword {
  static Map<dynamic, dynamic> info = {
    'email': '',
    'passwordA': '',
    'passwordN': '',
  };
}

class InformationAnnonces {
  static var info;
}

List adsFavorite = [''];

class InforamtionUser {
  static Map<dynamic, dynamic> info = {
    'id_acc': '',
    'name': '',
    'first_name': '',
    'pseudo': '',
    'about_me': '',
    'email': '',
    'phone': '',
    'address': '',
    'postcode': '',
    'civility': '',
    'type': '',
    'city': '',
    'state': '',
    'credit': '',
    'ip': '',
    //New
    'comp_name': '',
    'comp_num': '',
  };
}

class Informationloginetat {
  static Map<String, dynamic> info = {
    'etat': '',
  };
}

class AdsFavorite {
  static Map<String, dynamic> info = {
    'id_acc': '',
    'id_ad': '',
  };
}

List<String> civilityList = <String>[
  'M',
  'Mme',
  'Melle',
];

class StateAds {
  static void StateAdsChange(String id_ad, String state) async {
    String url = 'https://api.trocbuy.fr/flutter/duo_state_ads_change.php';

    Map<String, String> body = {
      'id_ad': id_ad,
      'state': state,
    };

    http.Response response = await http.post(Uri.parse(url), body: body);
  }
}
