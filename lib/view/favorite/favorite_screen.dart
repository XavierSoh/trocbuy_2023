import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/adsFavotireMag.dart';
import '../../res/strings.dart';
import '../components/ad_single_item_row.dart';
import '../components/custom_progress_indicator.dart';
import '../components/no_data_found.dart';
import '../login_page/provider/info_compte.dart';

import '../../global_functions/favorite_functions.dart';
import '../../model/ad.dart';
import '../../model/is_login.dart';
import '../../res/styles.dart';
import '../components/app_bar/default_app_bar.dart';
import '../login_page/login_page.dart';
import 'provider/provider_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  static const id = 'favorite_screen';

  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 32.5;

    return Scaffold(
      appBar: DefaultAppBar(title: Strings.kMyFavorites),
      body: IsLogin.state == true
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 90 / 100,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                stream: Provider.of<FavoriteFunctions>(context, listen: false)
                    .storedIdAdSelection(context,
                        Provider.of<FavoriteFunctions>(context).adFavorites)
                    .asStream(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        final List<Ad> ads = snapshot.data;
                        print('snapShot $ads');
                        if (ads.isNotEmpty) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                //indent: width / 100,
                                color: Styles.principalColor,
                                thickness: 0.5,
                              ),
                              itemCount: ads.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  child: AdSingleItemRow(
                                    ad: ads[index],
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return const NoDataFoundWidget();
                        }
                      }
                      if (snapshot.hasError) print('erreur ${snapshot.error})');
                      break;
                    default:
                  }

                  return const CustomProgressIndicator();
                },
              ),
            )
          : const LoginPage(),
    );
  }
}
