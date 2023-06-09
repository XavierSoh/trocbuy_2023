import 'package:json_annotation/json_annotation.dart';

part 'ad.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
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

  final String? pictureName;

  final int? idAd;

  final int? idReg;

  final int? idCounty;

  final int? idCat;

  final String? calendarDate;

  final int? idAcc;

  final int? pictureNum;

  final int? videoNum;

  final int? commentTotal;

  final double? commentAverage;

  final int? phoneHidden;

  final int? picturesNum;

  final int? picturesPack;

  final int? visitNum;

  final String? lastVisit;

  final String? lastHour;

  final String? companyName;

  final String? companyNum;

  final int? topDays;

  final int? topTime;

  final int? urgentDays;

  final int? urgentTime;

  final int? framedDays;

  final int? framedTime;

  final int? premiumDays;

  final int? premiumTime;

  final int? idShop;

  final int? idCatShop;

  final int? idRegShop;

  final int? idCountyShop;

  final String? titleShop;

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

  Map<String, dynamic> toJson() => _$AdToJson(this);
  factory Ad.fromJson(json) => _$AdFromJson(json);

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
