import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import '../../../providers/myads_provider.dart';

import '../../../model/ad.dart';
import '../component/my_ads_card.dart';
import 'no_ads.dart';

class GetAdsOnline extends StatefulWidget {
  const GetAdsOnline({Key? key}) : super(key: key);

  @override
  _GetAdsOnlineState createState() => _GetAdsOnlineState();
}

class _GetAdsOnlineState extends State<GetAdsOnline> {
  List<Ad> premiumDetails = [];
  var date;
  Future<List<Ad>> _premiumDetails(Response response) async {
    premiumDetails.clear();
    var jsonData = jsonDecode(response.body);

    print(jsonData);
    Ad premiums;
    for (var premiumVal in jsonData) {
      print('index');
      try {
        // print(premiumVal['date']);
        premiums = Ad(
          pictureName: premiumVal['picture_name'],
          title: premiumVal['title'],
          city: premiumVal['city'],
          text: premiumVal['text'],
          price: double.parse(premiumVal['price']),
          calendarDate: premiumVal['date'],
          hour: premiumVal['heure'],
          idAd: int.parse(premiumVal['id_ad']),
          urgent: int.parse(premiumVal['urgent']),
          pictureNum: int.tryParse(premiumVal['pictures_num']),
          visitNum: int.parse(premiumVal['visit_num']),
          state: int.parse(premiumVal['state']),
        );
        premiumDetails.add(premiums);
      } catch (e) {
        print(e);
      }
    }
    print('leght : ${premiumDetails.length}');
    return premiumDetails;
  }

  @override
  void initState() {
    // _premiumDetails(response)
    print(
        'response : ${Provider.of<MyAdsProvider>(context, listen: false).response!.body}');
    // TODO: implement initState
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: _premiumDetails(
            Provider.of<MyAdsProvider>(context, listen: false).response!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) {
                print(snapshot.data[index].pictureName);
                return MyAdsCard(
                  imagePath: snapshot.data[index].pictureName,
                  titreAnnonce: snapshot.data[index].title,
                  prixAnnonce: snapshot.data[index].price.toString(),
                  nomberVues: snapshot.data[index].visitNum.toString(),
                  // adsInfo: snapshot.data[index],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: snapshot.hasData ? premiumDetails.length : 0,
            );
          }
          if (!snapshot.hasData || premiumDetails.isEmpty) {
            return const NoAds();
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
    );
  }
}
