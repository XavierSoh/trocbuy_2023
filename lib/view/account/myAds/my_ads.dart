import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../model/user_infos.dart';
import '../../../providers/myads_provider.dart';
import '../../../res/styles.dart';
import '../../components/app_bar/default_app_bar.dart';
import 'get_ads_expired.dart';
import 'get_ads_online.dart';

class MyAds extends StatefulWidget {
  const MyAds({Key? key}) : super(key: key);

  @override
  _MyAdsState createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  adsNumber() async {
    String url = 'https://api.trocbuy.fr/flutter/duo_mesannonces.php';
    try {
      print('inof user = ${UserInfos.info}');
      await http.post(Uri.parse(url), body: {'id_acc': '5'}).then(
        (value) async {
          if (value.body.toString() != '"aucune annonce"') {
            Provider.of<MyAdsProvider>(context, listen: false)
                .changeResponse(value);
          }
          Provider.of<MyAdsProvider>(context, listen: false)
              .changeIsLoadingOnline(false);
        },
      );
    } catch (e) {
      print('info user = ${UserInfos.info}');
      Provider.of<MyAdsProvider>(context, listen: false)
          .changeIsLoadingOnline(false);
    }
  }

  @override
  void initState() {
    adsNumber();
    // TODO: implement initState
    super.initState();
  }

  int index = 0;
  @override
  build(BuildContext context) {
    GlobalKey<ContainedTabBarViewState> _key = GlobalKey();
    ContainedTabBarView containedTabBarView = ContainedTabBarView(
      key: _key,
      tabs: const [
        Text('En ligne'),
        Text('Second'),
      ],
      views: [
        Container(color: Colors.red),
        Container(color: Colors.green),
      ],
    );
    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: const DefaultAppBar(title: 'Mes Annonces'),
              body: Provider.of<MyAdsProvider>(context).isLoadingOnline
                  ? const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      ),
                    )
                  : ContainedTabBarView(
                      initialIndex: index,
                      tabs: const [
                        Tab(
                          text: "En ligne",
                        ),
                        Tab(
                          text: "Expirées",
                        ),
                      ],
                      views: const [
                        Center(child: GetAdsOnline()),
                        Center(child: GetAdsExpired()),
                      ],
                      tabBarProperties: TabBarProperties(
                        //isScrollable: true,
                        height: 56,
                        labelColor: Styles.principalColor,
                        unselectedLabelColor: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        alignment: TabBarAlignment.center,

                        //  padding: padding8,
                        indicator: ContainerTabIndicator(
                          height: 40,
                          width: 180,
                          radius: BorderRadius.circular(16.0),
                          color: Colors.white,
                          borderWidth: 2.0,
                          borderColor: Styles.principalColor,
                        ),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        background: Container(
                          decoration: const BoxDecoration(
                            color: Styles.principalColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24)),
                          ),
                        ),
                        //onChange: (index) => changeIndex.state = index,
                      ),
                    )
              // : TabBarView(
              //     children: [
              //       GetAdsOnline(),
              //       GetAdsExpired(),
              //     ],
              //   ),
              ),
        ),
      ),
    );
  }
}
