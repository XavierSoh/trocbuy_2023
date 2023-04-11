import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../../../res/styles.dart';
import 'title_widget.dart';

import '../../../model/county.dart';
import '../filter_providers/county_prov.dart';
import '../filter_providers/region_prov.dart';

class FilterCounties extends StatelessWidget {
  const FilterCounties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readCounty = context.read<CountyProv>();
    final watchCounty = context.watch<CountyProv>().county;
    County.counties.add(County(
        parReg: -1,
        idCountyLang: -1,
        nameCountyLang: 'Choisissez le département',
        idCounty: -1,
        codeLang: ''));
    return Visibility(
      visible: context.watch<RegionsProv>().region.idReg != -1,
      child: ListTile(
        title: const TitleWidget(title: 'Département'),
        subtitle: DropdownButton(
          value: watchCounty,
          isExpanded: true,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          underline: Container(
            height: 2,
            color: Styles.principalColor,
          ),
          onChanged: (County? newValue) async {
            readCounty.changeCounty(newValue!);
          },
          items: County.counties.where((element) {
            return context.watch<RegionsProv>().region.idReg == element.parReg;
          }).map<DropdownMenuItem<County>>(
            (County value) {
              return DropdownMenuItem<County>(
                value: value,
                child: Text(
                  value.nameCountyLang!,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
