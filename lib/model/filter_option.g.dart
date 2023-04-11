// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterOption _$FilterOptionFromJson(Map<String, dynamic> json) => FilterOption(
      optionsNames: FilterOption.optionNameFromJson(json['option_name']),
      optionValues: FilterOption.valuesFromJson(json['option_values'] as List),
      selectedValue: json['selectedValue'] as String? ?? "--",
    );

Map<String, dynamic> _$FilterOptionToJson(FilterOption instance) =>
    <String, dynamic>{
      'option_name': FilterOption.valuesToJson(instance.optionsNames),
      'option_values': instance.optionValues,
      'selectedValue': instance.selectedValue,
    };
