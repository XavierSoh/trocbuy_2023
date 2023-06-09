import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/model/county.dart';
import 'package:trocbuy/model/region.dart';
import 'package:trocbuy/providers/selected_county.dart';
import 'package:trocbuy/providers/selected_region.dart';

class RegionPicker extends StatelessWidget {
  const RegionPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            /*side: BorderSide(color: kPrincipal_colour)*/
          ),
          elevation: 8),
      onPressed: null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: DropdownButton<Region>(
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          underline: const SizedBox.shrink(),
          value: context.watch<SelectedRegion>().region,
          items: Region.regions
              .map(
                (e) => DropdownMenuItem<Region>(value: e, child: Text(e.nameRegLang)),
          )
              .toList(),
          onChanged: (value) {
            context.read<SelectedRegion>().change(value!);
            Provider.of<SelectedCounty>(context, listen: false).change(County(nameCountyLang: 'Choisissez le département'));
            Provider.of<SelectedCounty>(context, listen: false).getDepartment(context);

          },
        ),
      ),
    );
  }
}