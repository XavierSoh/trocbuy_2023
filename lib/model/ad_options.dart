import 'package:json_annotation/json_annotation.dart';

import 'ad_option1.dart';
import 'ad_option2.dart';
import 'ad_option3.dart';

part "ad_options.g.dart";

@JsonSerializable()
class AdOptions {
  final AdOption1 adOptions1;
  final AdOption2 adOptions2;
  final AdOption3 adOptions3;

  AdOptions(
      {required this.adOptions1,
      required this.adOptions2,
      required this.adOptions3});
}
