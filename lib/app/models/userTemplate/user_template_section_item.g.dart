// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_template_section_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTemplateSectionItem _$UserTemplateSectionItemFromJson(
    Map<String, dynamic> json) {
  return UserTemplateSectionItem(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    userTemplateSectionItemFeatures:
        (json['userTemplateSectionItemFeatures'] as List)
            ?.map((e) => e == null
                ? null
                : UserTemplateSectionItemFeature.fromJson(
                    e as Map<String, dynamic>))
            ?.toList(),
  );
}

Map<String, dynamic> _$UserTemplateSectionItemToJson(
        UserTemplateSectionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'userTemplateSectionItemFeatures': instance
          .userTemplateSectionItemFeatures
          ?.map((e) => e?.toJson())
          ?.toList(),
    };
