import 'package:json_annotation/json_annotation.dart';

part 'ad_image_model.g.dart';

@JsonSerializable()
class AdImageModel {
  @JsonKey(name: "id_ad")
  int? idAd;

  @JsonKey(name: "id_ima")
  int? idIma;

  @JsonKey(name: "picture_name")
  String? pictureName;

  AdImageModel({this.idAd, this.idIma, this.pictureName});

  factory AdImageModel.fromJson(Map<String, dynamic> json) =>
      _$AdImageModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdImageModelToJson(this);
}
