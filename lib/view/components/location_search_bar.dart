import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import '../../model/county.dart';
import '../../providers/search_icon_provider.dart';
import '../../providers/selected_county.dart';
import '../../providers/selected_region.dart';
import '../../res/styles.dart';
import '../category/component/cat_search_results.dart';
import '../county_ads/open_county.dart';
import '../region_ads/open_region.dart';

import '../../model/region.dart';

/// *
///Edited by Xavier SOH
/// 06/12/2021
class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({Key? key, this.hintText}) : super(key: key);
  final String? hintText;
  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  final TextEditingController controller = TextEditingController();

  @override
  build(BuildContext context) {
    return ChangeNotifierProvider<SearchIconProvider>(
      create: (_) => SearchIconProvider(),
      builder: (context, _) {
        final read = context.read<SearchIconProvider>();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: PhysicalModel(
            color: Styles.principalColor,
            elevation: 4,
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
            shadowColor: Styles.principalColor,
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: controller,
                  enabled: true,
                  onChanged: (m) {
                    if (controller.text.isEmpty) {
                      read.changeState(true);
                    } else {
                      read.changeState(false);
                    }
                  },
                  decoration: buildInputDecoration(context, controller,
                      hintText: widget.hintText ?? "")),
              suggestionsCallback: (typed) async {
                final List list;
                list = [
                  ...County.counties
                      .where(
                        (element) =>
                            element.nameCountyLang!.toLowerCase().contains(
                                  typed.toLowerCase(),
                                ),
                      )
                      .toList(),
                  ...Region.regions
                      .where(
                        (element) => element.nameRegLang.toLowerCase().contains(
                              typed.toLowerCase(),
                            ),
                      )
                      .toList(),
                ];
                return list;
              },
              hideOnError: true,
              hideOnEmpty: false,
              hideOnLoading: false,
              minCharsForSuggestions: 1,
              itemBuilder: (context, suggestion) {
                if (suggestion is Region) {
                  return RegionItem(
                    region: suggestion,
                  );
                } else if (suggestion is County) {
                  return CountyItem(
                    county: suggestion,
                  );
                }
                return NoItemFoundBuilder(controller: controller);
              },
              onSuggestionSelected: (string) {
                controller.clear();
              },
              noItemsFoundBuilder: (BuildContext context) {
                return NoItemFoundBuilder(controller: controller);
              },
              hideSuggestionsOnKeyboardHide: true,
            ),
          ),
        );
      },
    );
  }
}

class NoItemFoundBuilder extends StatelessWidget {
  const NoItemFoundBuilder({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            controller.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Styles.principalColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          CatSearchResult.id,
          (route) => route.isFirst,
          arguments: controller.text,
        );
        controller.clear();
      },
    );
  }
}

class CountyItem extends StatelessWidget {
  const CountyItem({Key? key, required this.county}) : super(key: key);
  final County county;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.read<SelectedCounty>().change(county);
          Navigator.pushNamedAndRemoveUntil(
            context,
            OpenCounty.id,
            (route) => route.isFirst,
          );
        },
        leading: const Icon(
          Icons.location_on_rounded,
        ),
        title: Text(
          county.nameCountyLang!,
        ),
      ),
    );
  }
}

class RegionItem extends StatelessWidget {
  const RegionItem({Key? key, required this.region}) : super(key: key);
  final Region region;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.read<SelectedRegion>().change(region);
          Navigator.pushNamedAndRemoveUntil(
            context,
            OpenRegion.id,
            (route) => route.isFirst,
          );
        },
        leading: const Icon(
          Icons.location_on_rounded,
        ),
        title: Text(region.nameRegLang),
      ),
    );
  }
}

InputDecoration buildInputDecoration(
    BuildContext context, TextEditingController controller,
    {String? hintText}) {
  final read = context.read<SearchIconProvider>();
  final watch = context.watch<SearchIconProvider>();

  return InputDecoration(
    enabled: true,
    isDense: true,
    filled: true,
    hintStyle: const TextStyle(fontWeight: FontWeight.w600),
    fillColor: Colors.white,
    hintText: hintText ?? 'Que Recherchez-Vous?',
    suffixIcon: const Icon(Icons.search) /* watch.show
        ?*/
    /*IconButton(
      color: Styles.principalColor,
      icon: const Icon(Icons.search),
      onPressed: () {
        //read.changeState(false);
        Navigator.pushNamedAndRemoveUntil(
          context,
          CatSearchResult.id,
          (route) => route.isFirst,
          arguments: controller.text,
        );
        controller.clear();
      },
    )*/
    /*  : IconButton(
            color: Styles.principalColor,
            icon: const Icon(Icons.close),
            onPressed: () {
              read.changeState(true);
              controller.clear();
            },
          )*/
    ,
    focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none),
    enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none),
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide.none),
  );
}
