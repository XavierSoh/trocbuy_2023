import 'dart:core';

import 'auvergne_rhone_alpes.dart';
import 'bourgogne_franche_comte.dart';
import 'bretagne.dart';
import 'centre_val_de_loire.dart';
import 'corse.dart';
import 'grand_est.dart';
import 'guadeloupe.dart';
import 'guyane.dart';
import 'hauts-de-france.dart';
import 'ile_de_france.dart';
import 'la_reunion.dart';
import 'martinique.dart';
import 'mayotte.dart';
import 'normandie.dart';
import 'nouvelle_aquitaine.dart';
import 'occitanie.dart';
import 'pays_de_la_loire.dart';
import 'provence_alpes_cote_d_azur.dart';

getCitiesOptions(int idRegion) {
  List<String> options = [];
  try {
    switch (idRegion) {
      case 1:
        options = auvergne();
        break;
      case 2:
        options = bourgogne();
        break;
      case 3:
        options = bretagne();
        break;
      case 4:
        options = centreValDeloire();
        break;
      case 5:
        options = corse();
        break;
      case 6:
        options = grandEst();
        break;
      case 7:
        options = hautDeFrance();
        break;

      case 8:
        options = ileDeFrance();
        break;

      case 9:
        options = normandie();
        break;
      case 10:
        options = nouvelleAquitaine();
        break;
      case 11:
        options = occitanie();
        break;
      case 12:
        options = paysDeLaLoire();
        break;
      case 13:
        options = provenceAlpeCoteDazur();
        break;
      case 14:
        options = guadeloupe();
        break;
      case 15:
        options = guyane();
        break;
      case 16:
        options = laReunion();
        break;
      case 17:
        options = martinique();
        break;
      case 18:
        options = mayotte();
        break;

      default:
        options = [];
    }
  } catch (exception) {
//ignore
  }

  return options;
}
