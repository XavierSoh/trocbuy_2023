import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_indicators/progress_indicators.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../../../res/styles.dart';

class DisplayAllRegion extends StatefulWidget {
  String region;
  bool type;
  DisplayAllRegion({required this.region, required this.type});

  @override
  _DisplayAllRegionState createState() => _DisplayAllRegionState();
}

class _DisplayAllRegionState extends State<DisplayAllRegion> {
  String number = '';

  Future<String> countAds() async {
    String link = 'https://api.trocbuy.fr/flutter/duo_ads_number_region.php';
    Map<String, String> body = {'reg': widget.region};

    var response = await http.post(Uri.parse(link), body: body);
    setState(() {
      number = jsonDecode(response.body)['number'];
    });
    return number;
  }

  @override
  void initState() {
    countAds();
    // TODO: implement initState
    super.initState();
  }

// stream: futureAdsRegion(index,widget.region).asStream(),
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 2.0),
      child: Container(
        decoration: Styles.adsBorderStyleDisplaying,
        child: StickyHeader(
          header: const Text(
              'ddd') /*TitleAds(
            title: '$number Annonces dans ${widget.region}',
            // button: true,
          )*/
          ,
          content: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: widget.type == true
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2.0,
                            childAspectRatio: 0.5),
                    itemBuilder: (context, index) {
                      return StreamBuilder(
                        // stream:
                        //futureAdsRegion(index, widget.region).asStream(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return Center(
                                  child: JumpingDotsProgressIndicator(
                                fontSize: 40.0,
                              ));
                            case ConnectionState.active:
                              return const Text('active');

                            case ConnectionState.done:
                              if (snapshot.hasData) {
                                return const Text("ddd");
                              }
                              if (snapshot.hasError) break;
                          }
                          return const Center(child: Text('Chargement ...'));
                        },
                      );
                    })
                : ListView.builder(itemBuilder: (context, index) {
                    return StreamBuilder(
                      // stream: futureAdsRegion(index, widget.region).asStream(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                                child: JumpingDotsProgressIndicator(
                              fontSize: 40.0,
                            ));
                          case ConnectionState.active:
                            return const Text('active');

                          case ConnectionState.done:
                            return const Text('dd');
                            break;
                        }
                        return const Text('loading');
                      },
                    );
                  }),
          ),
        ),
      ),
    );
  }
}
