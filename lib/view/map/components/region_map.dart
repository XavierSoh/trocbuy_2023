import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/model/region.dart';
import 'package:trocbuy/providers/selected_region.dart';
import 'package:trocbuy/res/strings.dart';
import 'package:trocbuy/services/admob_services.dart';
import 'package:trocbuy/view/components/ad_sort_button.dart';
import 'package:trocbuy/view/region_ads/open_region.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../functions/map_functions.dart';

class RegionsMap extends StatefulWidget {
  const RegionsMap({Key? key}) : super(key: key);

  @override
  _RegionsMapState createState() => _RegionsMapState();
}

class _RegionsMapState extends State<RegionsMap> {
  bool isLoading = true;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 90 / 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Strings.kFindOnCard,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 50 / 100,
                  width: MediaQuery.of(context).size.width * 100 / 100,
                  child: WebView(
                      initialUrl: 'https://api.trocbuy.fr/flutter/maps/map.php',
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (finish) {
                        setState(() {
                          isLoading = false;
                        });
                      },
                      navigationDelegate: (action) {
                        String areaClicked = MapFunctions.getRegions(action);

                        Region region = Region.regions.firstWhere(
                          (element) =>
                              element.nameRegLang.contains(areaClicked),
                        );
                        Future.delayed(
                          const Duration(milliseconds: 1),
                        ).then(
                          (value) {
                            AdSortButton.isOnAuthorPage = false;
                            AdSortButton.isAllFrance = false;
                            AdSortButton.isOnRegionPage = true;
                            AdSortButton.isArroundMe = false;
                            context.read<SelectedRegion>().change(region);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              OpenRegion.id,
                              (route) => route.isFirst,
                            );
                          },
                        );

                        return NavigationDecision.prevent;
                      }),
                ),
              ),
              Visibility(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : const SizedBox.shrink())
            ],
          ),
          const SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AdmobBanner(
              adUnitId: AdmobService.bannerAdUnitId,
              adSize: AdmobBannerSize.LARGE_BANNER,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
