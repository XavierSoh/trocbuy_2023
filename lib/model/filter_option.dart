import 'package:json_annotation/json_annotation.dart';

import 'option_name.dart';

part 'filter_option.g.dart';

@JsonSerializable()
class FilterOption {
  @JsonKey(
      name: "option_name", fromJson: optionNameFromJson, toJson: valuesToJson)
  final List<OptionName> optionsNames;

  @JsonKey(name: "option_values", fromJson: valuesFromJson)
  final List<Object> optionValues;

  late String selectedValue;
  FilterOption(
      {required this.optionsNames,
      required this.optionValues,
      this.selectedValue = "--"});

  factory FilterOption.fromJson(Map<String, dynamic> json) =>
      _$FilterOptionFromJson(json);

  Map<String, dynamic> toJson() => _$FilterOptionToJson(this);

  static optionNameFromJson(e) {
    return List.from(e)
        .map(
          (e) => OptionName.fromJson(e),
        )
        .toList();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterOption &&
          runtimeType == other.runtimeType &&
          optionsNames.first.nameCatOptLang ==
              other.optionsNames.first.nameCatOptLang &&
          optionsNames.first.idCatOpt == other.optionsNames.first.idCatOpt;

  @override
  int get hashCode => optionsNames.hashCode;

  static valuesFromJson(List<dynamic> e) => List.from(e);
  static valuesToJson(List<OptionName> optionNames) =>
      optionNames.map((e) => e.toJson()).toList();
}
