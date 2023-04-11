// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'county.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

County _$CountyFromJson(Map<String, dynamic> json) => County(
      idCountyLang: json['id_county_lang'] as int?,
      idCounty: json['id_county'] as int?,
      parReg: json['par_reg'] as int?,
      codeLang: json['code_lang'] as String?,
      nameCountyLang: json['name_county_lang'] as String?,
    );

Map<String, dynamic> _$CountyToJson(County instance) => <String, dynamic>{
      'id_county_lang': instance.idCountyLang,
      'id_county': instance.idCounty,
      'par_reg': instance.parReg,
      'code_lang': instance.codeLang,
      'name_county_lang': instance.nameCountyLang,
    };
