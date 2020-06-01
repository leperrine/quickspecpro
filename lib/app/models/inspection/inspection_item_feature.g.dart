// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_item_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionItemFeature _$InspectionItemFeatureFromJson(
    Map<String, dynamic> json) {
  return InspectionItemFeature(
    featureKey: json['featureKey'] as String,
    featureValues:
        (json['featureValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$InspectionItemFeatureToJson(
        InspectionItemFeature instance) =>
    <String, dynamic>{
      'featureKey': instance.featureKey,
      'featureValues': instance.featureValues,
    };
