import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapFunctions {
  static String getRegions(NavigationRequest action) {
    String region = '';
    try {
      region = action.url.replaceAll('https://api.trocbuy.fr/', '');
      region = region.replaceAll('%20', ' ');
      region = region.replaceAll('%C3%8E', 'î');
      region = region.replaceAll('%C3%A9', 'é');
      region = region.replaceAll('%C3%B4', 'ô');
    } catch (exception, trace) {
      if (kDebugMode) {
        print(exception);
        print(trace);
      }
    }
    return region;
  }
}

String getRegionCode(String region) {
  String regioncode = '';
  try {
    if (region == 'Guadeloupe') regioncode = '01';
    if (region == 'Martinique') regioncode = '02';
    if (region == 'Guyana') regioncode = '03';
    if (region == 'Reunion') regioncode = '04';
    if (region == 'Mayotte') regioncode = '06';
    if (region == 'Île-de-France') regioncode = '11';
    if (region == 'Nord-Pas-de-Calais' || region == 'Picardy')
      regioncode = '32';
    if (region == 'Centre') regioncode = '24';
    if (region == 'Bourgogne' || region == 'Franche-Comté') regioncode = '27';
    if (region == 'Basse-Normandie' || region == 'Haute-Normandie')
      regioncode = '28';
    if (region == 'Champagne-Ardenne' ||
        region == 'Lorraine' ||
        region == 'Alsace') regioncode = '44';
    if (region == 'Pays de la Loire') regioncode = '52';
    if (region == 'Brittany') regioncode = '53';
    if (region == 'Languedoc-Roussillon') regioncode = '76';
    if (region == 'Auvergne' || region == 'Rhône-Alpes') regioncode = '84';
    if (region == 'Provence-Alpes-Côte d \' Azur ') regioncode = ' 93 ';
    if (region == 'Corse') regioncode = '94';
    if (region == 'Aquitaine' ||
        region == 'Poitou-Charentes' ||
        region == 'Limousin') regioncode = '75';

    print('Regions code >>>>$regioncode');
  } catch (exception, trace) {
    if (kDebugMode) {
      print(exception);
      print(trace);
    }
  }

  return regioncode;
}
