import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/providers/search_distance_provider.dart';
import 'package:trocbuy/view/arround_me_ads/around_me_functions.dart';

import '../../../global_functions/ads_functions.dart';
import '../../../model/ad.dart';
import '../../../model/filter_names.dart';
import '../../../providers/ad_sort_by_provider.dart';
import '../../../providers/ads_view_type_provider.dart';
import '../../../res/styles.dart';
import '../../components/ad_single_item_grid.dart';
import '../../components/ad_single_item_row.dart';
import '../../components/custom_progress_indicator.dart';
import '../../components/no_data_found.dart';

class AroundMeContent extends StatelessWidget {
  const AroundMeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderBy = context.watch<AdSortByProvider>().adSortBy;
    final isGrid = context.watch<AdsViewTypeProvider>().isGrid;
    final distance = context.watch<SearchDistanceProvider>().distance;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;


    return Container(
      decoration: Styles.adsBorderStyleDisplaying,
      height: MediaQuery.of(context).size.height * 68 / 100,
      child: FutureBuilder(
        future: AdsFunctions().getAdsByPosition(
          FilterNames.aroundMe.name,
          distance,
          removeDiacritics(orderBy.name)
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length > 0) {
              List<Ad> ads = snapshot.data as List<Ad>;

              return SizedBox(
                height: height - 205,
                width: width,
                child: GridView.builder(
                  gridDelegate:
                      isGrid ? Styles.gridDelegate : Styles.rowDelegate,
                  itemCount: ads.length,
                  itemBuilder: (context, index) {
                    return isGrid
                        ? AdSingleItemGrid(
                            ad: ads[index],
                          )
                        : AdSingleItemRow(
                            ad: ads[index],
                          );
                  },
                ),
              );
            } else {
              return const NoDataFoundWidget();
            }
          }

          return const CustomProgressIndicator();
        },
      ),
    );
  }
}
