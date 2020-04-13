import 'package:json_annotation/json_annotation.dart';

part 'item_feature.g.dart';

@JsonSerializable()
class ItemFeature {
  ItemFeature({
    this.featureKey,
    this.featureValues,
  });
  final String featureKey;
  final List<String> featureValues;

  factory ItemFeature.fromJson(Map<String, dynamic> json) => _$ItemFeatureFromJson(json);
  Map<String, dynamic> toJson() => _$ItemFeatureToJson(this);
}
