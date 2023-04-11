import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/services/admob_services.dart';
import '../../providers/navigation_index.dart';
import '../account/account_home.dart';
import '../components/custom_navigation_bar.dart';
import '../favorite/favorite_screen.dart';
import '../publish/publish_screen.dart';
import 'components/home_content.dart';

class Home extends StatefulWidget {
  static const id = "home";

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(adUnitId: AdmobService.interstialAdUnitlId);
    interstitialAd.load();
    interstitialAd.show();
  }

  @override
  void dispose() {
    super.dispose();
    interstitialAd.dispose();
  }

  @override
  build(BuildContext context) {
    final index = context.watch<NavigationIndexProvider>().index;
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: const [
          HomeContent(),
          FavoriteScreen(),
          PublishScreen(),
          AccountHome(),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
