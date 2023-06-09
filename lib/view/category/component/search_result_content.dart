import 'package:diacritic/diacritic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/providers/search_model_prov.dart';
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
  const SearchResultContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isGrid = context.watch<AdsViewTypeProvider>().isGrid;
    final orderBy = context.watch<AdSortByProvider>().adSortBy;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final search = context.read<SearchModelProv>().searchModel;


    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 2.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: Styles.adsBorderStyleDisplaying,
              height: height * 70 / 100,
              child: FutureBuilder(
                future: AdsFunctions().getSearchResults(context),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {

                    if (snapshot.data.length > 0) {
                      List<Ad> ads = snapshot.data as List<Ad>;

                      return SizedBox(
                        height: height - 205,
                        width: width,
                        child: GridView.builder(
                          gridDelegate: isGrid ? Styles.gridDelegate : Styles.rowDelegate,
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
