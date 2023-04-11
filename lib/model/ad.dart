import 'package:json_annotation/json_annotation.dart';

part 'ad.g.dart';

@JsonSerializable()
class Ad implements Comparable {
  final int? top;
  final int? type;
  final int? date;
  final int? state;
  final int? status;
  final int? urgent;
  final double? lat;
  final double? lng;
  int? framed;
  final String? text;
  final String? hour;
  final int? premium;
  final String? city;

  final String? lang;
  final String? title;
  final double? price;
  final String? email;
  final String? phone;
  final String? video;
  final String? name;
  final String? postcode;

  @JsonKey(name: "picture_name")
  final String? pictureName;

  @JsonKey(name: "id_ad")
  final int? idAd;

  @JsonKey(name: "id_reg")
  final int? idReg;

  @JsonKey(name: "id_county")
  final int? idCounty;

  @JsonKey(name: "id_cat")
  final int? idCat;

  @JsonKey(name: "calendar_date")
  final String? calendarDate;

  @JsonKey(name: "id_acc")
  final int? idAcc;

  @JsonKey(name: "picture_num")
  final int? pictureNum;

  @JsonKey(name: "video_num")
  final int? videoNum;

  @JsonKey(name: "comment_total")
  final int? commentTotal;

  @JsonKey(name: "comment_average")
  final double? commentAverage;

  @JsonKey(name: "phone_hidden")
  final int? phoneHidden;

  @JsonKey(name: "pictures_num")
  final int? picturesNum;

  @JsonKey(name: "pictures_pack")
  final int? picturesPack;

  @JsonKey(name: "visit_num")
  final int? visitNum;

  @JsonKey(name: "last_v")
  final String? lastVisit;

  @JsonKey(name: "last_h")
  final String? lastHour;

  @JsonKey(name: "comp_name")
  final String? companyName;

  @JsonKey(name: "comp_num")
  final String? companyNum;

  @JsonKey(name: "top_days")
  final int? topDays;

  @JsonKey(name: "top_time")
  final int? topTime;

  @JsonKey(name: "urgent_days")
  final int? urgentDays;

  @JsonKey(name: "urgent_time")
  final int? urgentTime;

  @JsonKey(name: "framed_days")
  final int? framedDays;

  @JsonKey(name: "framed_time")
  final int? framedTime;

  @JsonKey(name: "premium_days")
  final int? premiumDays;

  @JsonKey(name: "premium_time")
  final int? premiumTime;

  @JsonKey(name: "id_shop")
  final int? idShop;

  @JsonKey(name: "id_cat_shop")
  final int? idCatShop;

  @JsonKey(name: "id_reg_shop")
  final int? idRegShop;

  @JsonKey(name: "id_county_shop")
  final int? idCountyShop;

  @JsonKey(name: "title_shop")
  final String? titleShop;

  @JsonKey(name: "type_acc")
  final int? typeAcc;

  Ad({
    this.idAd,
    this.lat,
    this.lng,
    this.top,
    this.type,
    this.text,
    this.date,
    this.hour,
    this.city,
    this.pictureName,
    this.lang,
    this.idReg,
    this.idCat,
    this.title,
    this.price,
    this.state,
    this.idAcc,
    this.email,
    this.phone,
    this.name,
    this.video,
    this.status,
    this.urgent = 0,
    this.idShop,
    this.framed,
    this.topTime,
    this.typeAcc,
    this.topDays,
    this.premium,
    this.idCounty,
    this.postcode,
    this.videoNum,
    this.visitNum,
    this.lastHour,
    this.titleShop,
    this.idRegShop,
    this.idCatShop,
    this.lastVisit,
    this.framedDays,
    this.framedTime,
    this.pictureNum,
    this.urgentDays,
    this.urgentTime,
    this.companyNum,
    this.premiumTime,
    this.premiumDays,
    this.phoneHidden,
    this.picturesNum,
    this.companyName,
    this.calendarDate,
    this.commentTotal,
    this.picturesPack,
    this.idCountyShop,
    this.commentAverage,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
  Map<String, dynamic> toJson() => _$AdToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ad && runtimeType == other.runtimeType && idAd == other.idAd;

  @override
  int get hashCode => idAd.hashCode;

  @override
  int compareTo(dynamic other) {
    int response = -1;
    if (other is Ad) {
      if (title == other.title) {
        response = 0;
      } else {
        response = 1;
      }
    } else {
      response = -1;
    }
    return response;
  }
}
