import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/services/admob_services.dart';
import 'package:trocbuy/view/message/message_home.dart';

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
  String release = "";

  @override
  void initState() {
    super.initState();
    interstitialAd =
        AdmobInterstitial(adUnitId: AdmobService.interstialAdUnitlId);
    interstitialAd.load();

    final newVersion = NewVersionPlus(
        iOSId: 'fr.trocbuy2',
        androidId: 'fr.trocbuy2',
        androidPlayStoreCountry: "fr_FR" //support country code
        );
    advancedStatusCheck(newVersion);
  }

  advancedStatusCheck(NewVersionPlus newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      debugPrint(status.releaseNotes);
      debugPrint(status.appStoreLink);
      debugPrint(status.localVersion);
      debugPrint(status.storeVersion);
      debugPrint(status.canUpdate.toString());
      if (status.canUpdate) {
        newVersion.showUpdateDialog(
          context: context,
          versionStatus: status,
          dialogTitle: 'Mise à jour disponible',
          dialogText:
              'Vous pouvez maintenant mettre à jour cette application de la version ${status.localVersion} vers la version ${status.storeVersion}',
          dismissButtonText: 'Plus tard',
          updateButtonText: 'Mettre à jour',
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    interstitialAd.dispose();
  }

  @override
  build(BuildContext context) {
    final index = context.watch<NavigationIndexProvider>().index;

    Future.delayed(const Duration(seconds: 0), () {
      interstitialAd.show();
    });
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          const HomeContent(),
          const FavoriteScreen(),
          const PublishScreen(),
          MessageHome(),
          const AccountHome(),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
