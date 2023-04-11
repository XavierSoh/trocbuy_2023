import 'package:json_annotation/json_annotation.dart';

part 'ad_option3.g.dart';

@JsonSerializable()
class AdOption3 implements Comparable {
  @JsonKey(name: "option3_name")
  String option3Name;

  dynamic option3;
  dynamic unity;

  AdOption3(
      {required this.option3, required this.option3Name, required this.unity});

  factory AdOption3.fromJson(Map<String, dynamic> json) =>
      _$AdOption3FromJson(json);
  Map<String, dynamic> toJson() => _$AdOption3ToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdOption3 &&
          runtimeType == other.runtimeType &&
          option3Name.toString().toLowerCase() ==
              other.option3Name.toString().toLowerCase() &&
          option3.toString().toLowerCase() ==
              other.option3.toString().toLowerCase() &&
          unity.toString().toLowerCase() ==
              other.unity.toString().toLowerCase();

  @override
  int get hashCode => option3Name.hashCode ^ option3.hashCode ^ unity.hashCode;

  @override
  int compareTo(other) {
    int response;
    if (other is AdOption3) {
      if (option3Name == other.option3Name) {
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
