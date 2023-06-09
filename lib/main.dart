import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:provider/provider.dart';
import 'package:trocbuy/global_functions/init_data.dart';
import 'package:trocbuy/model/region.dart';
import 'package:trocbuy/providers/message_model_prov.dart';
import 'package:trocbuy/providers/search_distance_provider.dart';
import 'package:trocbuy/providers/search_model_prov.dart';
import 'package:trocbuy/services/Location/lat_lag_location.dart';
import 'package:trocbuy/services/admob_services.dart';
import 'package:trocbuy/services/key_words_list.dart';
import 'package:trocbuy/view/login_page/provider/info_compte.dart';

import 'providers/ad_sort_by_provider.dart';
import 'providers/ads_view_type_provider.dart';
import 'providers/buy_credit_provider.dart';
import 'providers/filter_arguments.dart';
import 'providers/location_provider.dart';
import 'providers/myads_provider.dart';
import 'providers/navigation_index.dart';
import 'providers/password_provider.dart';
import 'providers/publish_provider.dart';
import 'providers/scollable_provider.dart';
import 'providers/selected_ad.dart';
import 'providers/selected_cat_lang.dart';
import 'providers/selected_county.dart';
import 'providers/selected_region.dart';
import 'providers/vitrine_pro_provider.dart';
import 'res/routes/routes.dart';
import 'res/styles.dart';
import 'res/themes/themes.dart';
import 'view/favorite/provider/provider_favorite.dart';
import 'view/home/home.dart';

import 'package:admob_flutter/admob_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  await Firebase.initializeApp();
  await Keywords.setKeyWordList();
  await Region.setRegion();
/*  var devices = [""];
  RequestConfiguration requestConfiguration =
      RequestConfiguration(testDeviceIds: devices);
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);*/

  // AroundMeFunctions.determinePosition();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationIndexProvider()),
        ChangeNotifierProvider(create: (_) => InfoCompteController()),
        ChangeNotifierProvider(create: (_) => PublishProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => MyAdsProvider()),
        ChangeNotifierProvider(create: (_) => PasswordProvider()),
        ChangeNotifierProvider(create: (_) => BuyCreditProvider()),
        ChangeNotifierProvider(create: (_) => VitrineProProvider()),
        ChangeNotifierProvider(create: (_) => SelectedAd()),
        ChangeNotifierProvider(create: (_) => ScrollableProvider()),
        ChangeNotifierProvider(create: (_) => SelectedCatLang()),
        ChangeNotifierProvider(create: (_) => AdSortByProvider()),
        ChangeNotifierProvider(create: (_) => AdsViewTypeProvider()),
        ChangeNotifierProvider(create: (_) => SelectedRegion()),
        ChangeNotifierProvider(create: (_) => SelectedCounty()),
        ChangeNotifierProvider(create: (_) => FilterArgumentsProv()),
        ChangeNotifierProvider(create: (_) => FavoriteFunctions()),
        ChangeNotifierProvider(create: (_) => SearchDistanceProvider()),
        ChangeNotifierProvider(create: (_) => SearchModelProv()),
        ChangeNotifierProvider(create: (_) => MessageModelProv()),
      ],
      child: const Trocbuy(),
    ),
  );
}

const int maxFailedLoadAttempts = 3;

class Trocbuy extends StatefulWidget {
  const Trocbuy({Key? key}) : super(key: key);

  @override
  State<Trocbuy> createState() => _TrocbuyState();
}

class _TrocbuyState extends State<Trocbuy> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  void initState() {
    Admob.requestTrackingAuthorization();

    LocationFunction.getLocationPermission();
    //getAgree();
    //getIsLogin();

    super.initState();
  }

  /*getIsLogin() async {
    HelperFunctions.getUserLoggedInSharedPreference().then(
      (value) {
        setState(
          () {
            IsLogin.state = value;
            if (value) {
              getUserInfo(context: context);
            }
          },
        );
      },
    );
  }*/

  bool agree = false;

/*  Future<bool> getAgree() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    bool agree2 = sharedPreferences.getBool("agree")!;

    agree = agree2;

    return agree2;
  }*/

  @override
  build(BuildContext context) {
    initializeDateFormatting('fr_FR');
    return MaterialApp(
      color: Styles.principalColor,
      home: !InitData.initialised
          ? EasySplashScreen(
              showLoader: false,
              logo: Image.asset('images/transparent.png'),
              backgroundColor: Styles.principalColor,
              futureNavigator: InitData(context: context).initData(),
              backgroundImage: const AssetImage("images/splashscreen.png"),
            )
          :  const Home(),


      theme: CustomThemes.themeData,
      routes: Routes.routes,
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      //initialRoute: Routes.initialRoute,
    );
  }
}
