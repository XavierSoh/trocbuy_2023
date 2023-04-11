import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../../res/strings.dart';
import '../../../res/styles.dart';
import 'title_widget.dart';

import '../../../model/county.dart';
import '../../../model/region.dart';
import '../filter_providers/county_prov.dart';
import '../filter_providers/options_prov.dart';
import '../filter_providers/region_prov.dart';

class FilterRegions extends StatelessWidget {
  const FilterRegions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readRegion = context.read<RegionsProv>();
    final watchRegion = context.watch<RegionsProv>().region;
    final readCounty = context.read<CountyProv>();
    return ListTile(
      title: TitleWidget(
        title: Strings.kRegion,
      ),
      subtitle: DropdownButton(
        value: watchRegion,
        isExpanded: true,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Styles.principalColor,
        ),
        onChanged: (Region? newValue) async {
          readRegion.changeRegion(newValue!);
          readCounty.changeCounty(County.counties.where((element) {
            return element.parReg == newValue.idReg;
          }).first);
          final readOptionsProv = context.read<OptionsProv>();
          readOptionsProv.clearOptions();
        },
        items: Region.regions.map<DropdownMenuItem<Region>>((Region value) {
          return DropdownMenuItem<Region>(
            value: value,
            child: Text(value.nameRegLang),
          );
        }).toList(),
      ),
    );
  }
}
