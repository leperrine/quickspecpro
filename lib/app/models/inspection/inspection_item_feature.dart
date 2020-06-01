import 'package:json_annotation/json_annotation.dart';

part 'inspection_item_feature.g.dart';

@JsonSerializable()
class InspectionItemFeature {
  InspectionItemFeature({
    this.featureKey,
    this.featureValues,
  });
  final String featureKey;
  final List<String> featureValues;

  factory InspectionItemFeature.fromJson(Map<String, dynamic> json) => _$InspectionItemFeatureFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionItemFeatureToJson(this);
}
