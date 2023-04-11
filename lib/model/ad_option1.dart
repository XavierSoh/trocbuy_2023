import 'package:json_annotation/json_annotation.dart';

part 'ad_option1.g.dart';

@JsonSerializable()
class AdOption1 implements Comparable {
  @JsonKey(name: "option1_name")
  String option1Name;

  dynamic option1;

  AdOption1({required this.option1, required this.option1Name});

  factory AdOption1.fromJson(Map<String, dynamic> json) =>
      _$AdOption1FromJson(json);
  Map<String, dynamic> toJson() => _$AdOption1ToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdOption1 &&
          runtimeType == other.runtimeType &&
          option1Name.toString().toLowerCase() == other.option1Name.toString().toLowerCase() &&
          option1.toString().toLowerCase() == other.option1.toString().toLowerCase();

  @override
  int get hashCode => option1Name.hashCode ^ option1.hashCode;

  @override
  int compareTo(dynamic other) {
    int response = -1;
    if (other is AdOption1) {
      if (this == other) {
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
