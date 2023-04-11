import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../global_functions/ads_functions.dart';
import '../../model/filter_names.dart';
import '../../providers/ad_sort_by_provider.dart';
import '../../providers/selected_cat_lang.dart';
import '../../res/styles.dart';
import '../components/ad_single_item_grid.dart';
import '../components/custom_progress_indicator.dart';

import '../../model/ad.dart';
import '../../providers/ads_view_type_provider.dart';
import '../components/ad_single_item_row.dart';
import '../components/no_data_found.dart';

class SingleCategoryContent extends StatelessWidget {
  const SingleCategoryContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isGrid = context.watch<AdsViewTypeProvider>().isGrid;
    final orderBy = context.watch<AdSortByProvider>().adSortBy;
    final currentCatLang = context.watch<SelectedCatLang>().catLang;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 2.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 70 / 100,
        decoration: Styles.adsBorderStyleDisplaying,
        child: FutureBuilder(
          future: AdsFunctions().getAdsByParameters(
            FilterNames.filterByCategory.name,
            {
              "cat_lang": currentCatLang.toJson(),
              "order_by": removeDiacritics(orderBy.name)
            },
          ),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
      ),
    );
  }
}
