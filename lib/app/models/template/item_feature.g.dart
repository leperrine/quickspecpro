// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemFeature _$ItemFeatureFromJson(Map<String, dynamic> json) {
  return ItemFeature(
    featureKey: json['featureKey'] as String,
    featureValues:
        (json['featureValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ItemFeatureToJson(ItemFeature instance) =>
    <String, dynamic>{
      'featureKey': instance.featureKey,
      'featureValues': instance.featureValues,
    };
