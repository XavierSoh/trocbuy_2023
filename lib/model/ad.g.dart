// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) => Ad(
      idAd: json['id_ad'] as int?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      top: json['top'] as int?,
      type: json['type'] as int?,
      text: json['text'] as String?,
      date: json['date'] as int?,
      hour: json['hour'] as String?,
      city: json['city'] as String?,
      pictureName: json['picture_name'] as String?,
      lang: json['lang'] as String?,
      idReg: json['id_reg'] as int?,
      idCat: json['id_cat'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      state: json['state'] as int?,
      idAcc: json['id_acc'] as int?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      video: json['video'] as String?,
      status: json['status'] as int?,
      urgent: json['urgent'] as int? ?? 0,
      idShop: json['id_shop'] as int?,
      framed: json['framed'] as int?,
      topTime: json['top_time'] as int?,
      typeAcc: json['type_acc'] as int?,
      topDays: json['top_days'] as int?,
      premium: json['premium'] as int?,
      idCounty: json['id_county'] as int?,
      postcode: json['postcode'] as String?,
      videoNum: json['video_num'] as int?,
      visitNum: json['visit_num'] as int?,
      lastHour: json['last_hour'] as String?,
      titleShop: json['title_shop'] as String?,
      idRegShop: json['id_reg_shop'] as int?,
      idCatShop: json['id_cat_shop'] as int?,
      lastVisit: json['last_visit'] as String?,
      framedDays: json['framed_days'] as int?,
      framedTime: json['framed_time'] as int?,
      pictureNum: json['picture_num'] as int?,
      urgentDays: json['urgent_days'] as int?,
      urgentTime: json['urgent_time'] as int?,
      companyNum: json['company_num'] as String?,
      premiumTime: json['premium_time'] as int?,
      premiumDays: json['premium_days'] as int?,
      phoneHidden: json['phone_hidden'] as int?,
      picturesNum: json['pictures_num'] as int?,
      companyName: json['company_name'] as String?,
      calendarDate: json['calendar_date'] as String?,
      commentTotal: json['comment_total'] as int?,
      picturesPack: json['pictures_pack'] as int?,
      idCountyShop: json['id_county_shop'] as int?,
      commentAverage: (json['comment_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'top': instance.top,
      'type': instance.type,
      'date': instance.date,
      'state': instance.state,
      'status': instance.status,
      'urgent': instance.urgent,
      'lat': instance.lat,
      'lng': instance.lng,
      'framed': instance.framed,
      'text': instance.text,
      'hour': instance.hour,
      'premium': instance.premium,
      'city': instance.city,
      'lang': instance.lang,
      'title': instance.title,
      'price': instance.price,
      'email': instance.email,
      'phone': instance.phone,
      'video': instance.video,
      'name': instance.name,
      'postcode': instance.postcode,
      'picture_name': instance.pictureName,
      'id_ad': instance.idAd,
      'id_reg': instance.idReg,
      'id_county': instance.idCounty,
      'id_cat': instance.idCat,
      'calendar_date': instance.calendarDate,
      'id_acc': instance.idAcc,
      'picture_num': instance.pictureNum,
      'video_num': instance.videoNum,
      'comment_total': instance.commentTotal,
      'comment_average': instance.commentAverage,
      'phone_hidden': instance.phoneHidden,
      'pictures_num': instance.picturesNum,
      'pictures_pack': instance.picturesPack,
      'visit_num': instance.visitNum,
      'last_visit': instance.lastVisit,
      'last_hour': instance.lastHour,
      'company_name': instance.companyName,
      'company_num': instance.companyNum,
      'top_days': instance.topDays,
      'top_time': instance.topTime,
      'urgent_days': instance.urgentDays,
      'urgent_time': instance.urgentTime,
      'framed_days': instance.framedDays,
      'framed_time': instance.framedTime,
      'premium_days': instance.premiumDays,
      'premium_time': instance.premiumTime,
      'id_shop': instance.idShop,
      'id_cat_shop': instance.idCatShop,
      'id_reg_shop': instance.idRegShop,
      'id_county_shop': instance.idCountyShop,
      'title_shop': instance.titleShop,
      'type_acc': instance.typeAcc,
    };
