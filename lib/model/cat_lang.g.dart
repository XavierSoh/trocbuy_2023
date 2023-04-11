// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_lang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatLang _$CatLangFromJson(Map<String, dynamic> json) => CatLang(
      idCatLang: json['id_cat_lang'] as int?,
      idCat: json['id_cat'] as int?,
      parCat: json['par_cat'] as int?,
      codeLang: json['code_lang'] as String?,
      nameCatLang: json['name_cat_lang'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$CatLangToJson(CatLang instance) => <String, dynamic>{
      'id_cat_lang': instance.idCatLang,
      'id_cat': instance.idCat,
      'par_cat': instance.parCat,
      'code_lang': instance.codeLang,
      'name_cat_lang': instance.nameCatLang,
      'quantity': instance.quantity,
    };
