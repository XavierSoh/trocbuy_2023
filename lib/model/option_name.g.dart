// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionName _$OptionNameFromJson(Map<String, dynamic> json) => OptionName(
      nameCatOptLang: json['name_cat_opt_lang'] as String,
      idCatOpt: OptionName.intParserFromJson(json['id_cat_opt']),
      unitCatOptLang: json['unit_cat_opt_lang'] as String,
    );

Map<String, dynamic> _$OptionNameToJson(OptionName instance) =>
    <String, dynamic>{
      'name_cat_opt_lang': instance.nameCatOptLang,
      'id_cat_opt': instance.idCatOpt,
      'unit_cat_opt_lang': instance.unitCatOptLang,
    };
