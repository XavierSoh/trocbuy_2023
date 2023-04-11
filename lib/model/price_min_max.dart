import 'package:json_annotation/json_annotation.dart';

part 'price_min_max.g.dart';

@JsonSerializable()
class PriceMinMax {
  final String priceMin;
  final String priceMax;

  PriceMinMax({required this.priceMin, required this.priceMax});
}
