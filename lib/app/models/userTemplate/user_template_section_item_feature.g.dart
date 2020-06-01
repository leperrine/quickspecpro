// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_template_section_item_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTemplateSectionItemFeature _$UserTemplateSectionItemFeatureFromJson(
    Map<String, dynamic> json) {
  return UserTemplateSectionItemFeature(
    featureName: json['featureName'] as String,
    featureValues:
        (json['featureValues'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserTemplateSectionItemFeatureToJson(
        UserTemplateSectionItemFeature instance) =>
    <String, dynamic>{
      'featureName': instance.featureName,
      'featureValues': instance.featureValues,
    };
