import 'package:json_annotation/json_annotation.dart';

part 'user_template_section_item_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class UserTemplateSectionItemFeature {
  UserTemplateSectionItemFeature({
    this.featureName,
    List<String> featureValues,
  }) : featureValues = featureValues ?? <String>[];
  final String featureName;
  List<String> featureValues;

  factory UserTemplateSectionItemFeature.fromJson(Map<String, dynamic> json) =>
      _$UserTemplateSectionItemFeatureFromJson(json);
  Map<String, dynamic> toJson() => _$UserTemplateSectionItemFeatureToJson(this);
}
