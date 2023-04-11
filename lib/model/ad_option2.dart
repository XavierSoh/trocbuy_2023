import 'package:json_annotation/json_annotation.dart';

part 'ad_option2.g.dart';

@JsonSerializable()
class AdOption2 implements Comparable {
  @JsonKey(name: "option2_name")
  dynamic option2Name;

  dynamic option2;

  AdOption2({required this.option2, required this.option2Name});

  factory AdOption2.fromJson(Map<String, dynamic> json) =>
      _$AdOption2FromJson(json);
  Map<String, dynamic> toJson() => _$AdOption2ToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdOption2 &&
          runtimeType == other.runtimeType &&
          option2Name.toString().toLowerCase() == other.option2Name.toString().toLowerCase() &&
          option2.toString().toLowerCase() == other.option2.toString().toLowerCase();

  @override
  int get hashCode => option2Name.hashCode ^ option2.hashCode;

  @override
  int compareTo(other) {
    int response;
    if (other is AdOption2) {
      if (this == other) {
        response = 0;
      } else {
        response = -1;
      }
    } else {
      response = 1;
    }

    return response;
  }
}
