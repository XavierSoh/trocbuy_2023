import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import '../../../providers/vitrine_pro_provider.dart';

import '../../../model/ad.dart';
import '../../../res/styles.dart';
import '../component/my_ads_card.dart';
import '../myAds/no_ads.dart';

class AddToVitrinePro extends StatefulWidget {
  const AddToVitrinePro({Key? key}) : super(key: key);

  @override
  _AddToVitrineProState createState() => _AddToVitrineProState();
}

class _AddToVitrineProState extends State<AddToVitrinePro> {
  List<Ad> premiumDetails = [];

  Future<List<Ad>> _premiumDetails(Response response) async {
    premiumDetails.clear();
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
    _premiumDetails(
        Provider.of<VitrineProProvider>(context, listen: false).response);
    // TODO: implement initState
    Provider.of<VitrineProProvider>(context, listen: false)
        .buildIsSelectedList(premiumDetails.length);
    super.initState();
  }

  List<bool> isSelected = List.generate(20, (index) => false);
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.principalColor,
        title: const Text('Mes Annonces'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream:
              _premiumDetails(Provider.of<VitrineProProvider>(context).response)
                  .asStream(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Provider.of<VitrineProProvider>(context, listen: false)
                  .changeHasAds(true);
              return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (Provider.of<VitrineProProvider>(context,
                              listen: false)
                          .isSelected[index]) {
                        Provider.of<VitrineProProvider>(context, listen: false)
                            .removeIdAds(index.toString());
                      } else {
                        Provider.of<VitrineProProvider>(context, listen: false)
                            .addIdAds(index.toString());
                      }
                      Provider.of<VitrineProProvider>(context, listen: false)
                          .changeIsSelectedValue(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(1.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Provider.of<VitrineProProvider>(context)
                                .isSelected[index]
                            ? Colors.green
                            : null,
                      ),
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
      ),
      floatingActionButton: Provider.of<VitrineProProvider>(context).hasAds
          ? FloatingActionButton.extended(
              onPressed: () {
                /*
                * Get id's of ads select and put it in table VitrineProId dataBase
                * Update list of ads // _premuimeList() //
                * Update Response for VitrinePro
                * */
                Navigator.pop(context);
              },
              label: const Text('Ajouter'),
            )
          : null,
    );
  }
}
