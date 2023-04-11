// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      idRegLang: json['id_reg_lang'] as int,
      idReg: json['id_reg'] as int,
      codeLang: json['code_lang'] as String,
      nameRegLang: json['name_reg_lang'] as String,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id_reg_lang': instance.idRegLang,
      'id_reg': instance.idReg,
      'code_lang': instance.codeLang,
      'name_reg_lang': instance.nameRegLang,
    };
