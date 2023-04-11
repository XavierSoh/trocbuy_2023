import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../global_functions/ads_functions.dart';
import '../../../model/filter_names.dart';
import '../../../providers/ad_sort_by_provider.dart';
import '../../../res/styles.dart';
import '../../components/ad_single_item_grid.dart';
import '../../components/custom_progress_indicator.dart';

import '../../../model/ad.dart';
import '../../../providers/ads_view_type_provider.dart';
import '../../components/ad_single_item_row.dart';
import '../../components/no_data_found.dart';

class SearchResultContent extends StatelessWidget {
  const SearchResultContent({Key? key, required this.suggestion})
      : super(key: key);
  final String suggestion;

  @override
  Widget build(BuildContext context) {
    final isGrid = context.watch<AdsViewTypeProvider>().isGrid;
    final orderBy = context.watch<AdSortByProvider>().adSortBy;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 2.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: Styles.adsBorderStyleDisplaying,
              height: height * 70 / 100,
              child: FutureBuilder(
                future: AdsFunctions().getSearchResults(
                  FilterNames.allAds.name,
                  {
                    "cat_lang": {
                      "searchText": suggestion,
                    },
                    "order_by": removeDiacritics(
                      orderBy.name,
                    ),
                  },
                ),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
            )
          ],
        ),
      ),
    );
  }
}
