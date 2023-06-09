import 'package:flutter/material.dart';

import '../../res/strings.dart';
import '../../res/styles.dart';
import '../components/app_bar/default_app_bar.dart';
import '../components/location_search_bar.dart';
import 'components/all_france_and_arround_me.dart';
import 'components/region_map.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);
  static const id = "map_screen";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.principalColor,
      child: SafeArea(
        child: Scaffold(
          appBar: DefaultAppBar(
            title: Strings.kAdvancedResearch,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                LocationSearchBar(hintText: Strings.kWhereDoYouFind),
                //const RegionArea(),

                const AllFranceAndAroundMe(),
                const RegionsMap()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
