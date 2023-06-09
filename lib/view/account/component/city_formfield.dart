import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:trocbuy/constants/constants.dart';
import 'package:trocbuy/global_functions/default_validator.dart';
import 'package:trocbuy/providers/selected_region.dart';
import 'package:trocbuy/data/cities/villes/get_cities_options.dart';

class CityFormfield extends StatelessWidget {
  const CityFormfield({Key? key, required this.controller}) : super(key: key);
final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10.0),
      child: TypeAheadFormField<String>(
        autoFlipDirection: true,
        direction: AxisDirection.up,
        textFieldConfiguration: TextFieldConfiguration(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Ville',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15.0),
          ),
        ),
        itemBuilder: (context, value) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value, style: const TextStyle(fontSize: 16.0),),
          );
        },
        hideOnEmpty: true,
        validator: DefaultValidator.validator,
        suggestionsCallback: (value) async {
          final List<String> options =
          getCitiesOptions(context
              .read<SelectedRegion>()
              .region
              .idReg);
          return options.where((element) =>
              element.toLowerCase().contains(
                value.toLowerCase(),
              ),);
        },
        onSuggestionSelected: (String selection) {
          CompteInformation.info['city'] = selection;
          controller.text = selection;
        },
      ),
    );
  }
}
