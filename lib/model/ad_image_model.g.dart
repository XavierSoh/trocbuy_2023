// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdImageModel _$AdImageModelFromJson(Map<String, dynamic> json) => AdImageModel(
      idAd: json['id_ad'] as int?,
      idIma: json['id_ima'] as int?,
      pictureName: json['picture_name'] as String?,
    );

Map<String, dynamic> _$AdImageModelToJson(AdImageModel instance) =>
    <String, dynamic>{
      'id_ad': instance.idAd,
      'id_ima': instance.idIma,
      'picture_name': instance.pictureName,
    };
