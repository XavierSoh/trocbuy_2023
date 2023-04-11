import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../../providers/filter_arguments.dart';
import '../../../res/strings.dart';
import '../filter_providers/cat_lang_filter_prov.dart';
import '../filter_result.dart';

import '../filter_providers/county_prov.dart';
import '../filter_providers/options_prov.dart';
import '../filter_providers/region_prov.dart';
import '../filter_providers/search_in_prov.dart';

class ThrowSearch extends StatelessWidget {
  const ThrowSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green)),
        child: Text(
          Strings.kThrowSearch,
          style: const TextStyle(fontSize: 18),
        ),
        onPressed: () {
          final readOption = context.read<OptionsProv>();
          var readCategory = context.read<CatLangFilterProv>().catLang;
          final readTitleOnly = context.read<SearchInProv>().titleOnly;
          final readUrgenceOnly = context.read<SearchInProv>().emergencyOnly;
          final readWithPhoto = context.read<SearchInProv>().withPhoto;
          final readCounty = context.read<CountyProv>().county;
          final readRegion = context.read<RegionsProv>().region;
          List<Map<String, dynamic>> serverOptions = readOption.options
              .where((element) => element.selectedValue != "--")
              .map((e) {
            return {e.optionsNames.first.idCatOpt.toString(): e.selectedValue};
          }).toList();
          Map<String, dynamic> body = {
            "category": readCategory.toJson(),
            "title_only": readTitleOnly,
            "urgent_only": readUrgenceOnly,
            "with_photo": readWithPhoto,
            "county": readCounty.toJson(),
            "region": readRegion.toJson(),
            "options": serverOptions
          };
          context.read<FilterArgumentsProv>().updateBody(body);

          Navigator.pushNamedAndRemoveUntil(
            context,
            FilterResult.id,
            (route) => route.isFirst,
          );
        },
      ),
    );
  }
}
