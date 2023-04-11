import 'package:json_annotation/json_annotation.dart';

part 'option_name.g.dart';

@JsonSerializable()
class OptionName {
  @JsonKey(name: "name_cat_opt_lang")
  final String nameCatOptLang;

  @JsonKey(name: "id_cat_opt", fromJson: intParserFromJson)
  final int idCatOpt;

  @JsonKey(name: "unit_cat_opt_lang")
  final String unitCatOptLang;

  OptionName(
      {required this.nameCatOptLang,
      required this.idCatOpt,
      required this.unitCatOptLang});

  factory OptionName.fromJson(Map<String, dynamic> json) =>
      _$OptionNameFromJson(json);

  Map<String, dynamic> toJson() => _$OptionNameToJson(this);

  static intParserFromJson(e) {
    return int.parse(e);
  }
}
