import 'package:json_annotation/json_annotation.dart';

part 'imagesfeatures.g.dart';

@JsonSerializable()
class ImagesFeatures {
  @JsonKey(name: "id_ad")
  String? idAd;

  @JsonKey(name: "id_ima")
  String? idIma;

  String? name;

  ImagesFeatures({this.idAd, this.idIma, this.name});

  factory ImagesFeatures.fromJson(Map<String, dynamic> json) =>
      _$ImagesFeaturesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesFeaturesToJson(this);
}
