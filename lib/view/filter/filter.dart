import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/strings.dart';
import '../../res/styles.dart';
import '../components/app_bar/default_app_bar.dart';
import 'component/filter_cat_lang.dart';
import 'filter_providers/cat_lang_filter_prov.dart';
import 'filter_providers/price_min_max.dart';

import 'component/filter_counties.dart';
import 'component/filter_options.dart';
import 'component/filter_regions.dart';
import 'component/filter_search_in.dart';
import 'component/throw_search.dart';
import 'filter_providers/county_prov.dart';
import 'filter_providers/options_prov.dart';
import 'filter_providers/region_prov.dart';
import 'filter_providers/search_in_prov.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);
  static const id = "filter";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CatLangFilterProv()),
            ChangeNotifierProvider(create: (_) => OptionsProv()),
            ChangeNotifierProvider(create: (_) => SearchInProv()),
            ChangeNotifierProvider(create: (_) => PriceMinMaxProv()),
            ChangeNotifierProvider(create: (_) => RegionsProv()),
            ChangeNotifierProvider(create: (_) => CountyProv()),
          ],
          builder: (BuildContext context, _) {
            final watchCategory = context.watch<CatLangFilterProv>().catLang;
            return Scaffold(
              appBar: DefaultAppBar(
                title: Strings.kFilter,
              ),
              body: ListView(
                children: [
                  const FilterCatLang(),
                  const SizedBox(height: 8.0),
                  const FilterSearchIn(),
                  const SizedBox(height: 8.0),
                  const FilterRegions(),
                  const SizedBox(height: 8.0),
                  const FilterCounties(),
                  Visibility(
                    visible: watchCategory.parCat != 0,
                    child: const FilterOptions(),
                  ),
                  const SizedBox(height: 8.0),
                  const ThrowSearch()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
