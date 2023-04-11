import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/ad.dart';
import '../../../providers/vitrine_pro_provider.dart';
import '../component/my_ads_card.dart';
import '../myAds/no_ads.dart';

class AdsVitrinePro extends StatefulWidget {
  const AdsVitrinePro({Key? key}) : super(key: key);

  @override
  _AdsVitrineProState createState() => _AdsVitrineProState();
}

class _AdsVitrineProState extends State<AdsVitrinePro> {
  List<Ad> premiumDetails = [];
  String id = '';
  String name = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl =
      'https://api.trocbuy.fr/flutter/trocbuy28/images/compte_utilisateur.png';
  String first_name = '';
  String pseudo = '';

  late SharedPreferences prefs;

  Future readLocal() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      pseudo = prefs.getString('pseudo') ?? '';
      id = prefs.getString('id') ?? '';
      name = prefs.getString('name') ?? '';
      first_name = prefs.getString('first_name') ?? '';
      nickname = name + ' ' + first_name;
      aboutMe = prefs.getString('aboutMe') ?? '';
      // photoUrl = prefs.getString('photoUrl') ?? '';
    });
  }

  Future<List<Ad>> _premiumDetails(Response response) async {
    premiumDetails.clear();
    /*
       * Check if id ads from response is contain in id's vitrinePro from VitrineProProvider();
       * if it is contain so add it to premiumDetails List to print it in screen;
    */
    var jsonData = json.decode(response.body);
    for (var premiumVal in jsonData) {
      Ad premiums = Ad(
          /*
        premiumVal['picture_name'],
        premiumVal['title'],
        premiumVal['city'],
        premiumVal['text'],
        premiumVal['pictures_num'],
        premiumVal['price'],
        premiumVal['date'],
        premiumVal['heure'],
        premiumVal['id_ad'],
        premiumVal['urgent'],
        premiumVal['visit_num'],*/
          );
      premiumDetails.add(premiums);
    }
    return premiumDetails;
  }

  @override
  void initState() {
    readLocal();
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream:
              _premiumDetails(Provider.of<VitrineProProvider>(context).response)
                  .asStream(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to ads page
                    },
                    child: Container(
                      child: MyAdsCard(
                        imagePath: snapshot.data[index].picture_name,
                        titreAnnonce: snapshot.data[index].title,
                        prixAnnonce: snapshot.data[index].price,
                        jourExpirer: 50,
                        nomberVues: snapshot.data[index].visit_num,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: snapshot.hasData ? premiumDetails.length : 0,
              );
            } else if (!snapshot.hasData) {
              return const Center(child: NoAds());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "There is some error in uploading file",
                ),
              );
            }
            return Center(
              child: JumpingDotsProgressIndicator(
                fontSize: 40.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
