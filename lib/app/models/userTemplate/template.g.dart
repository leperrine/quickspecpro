// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTemplate _$UserTemplateFromJson(Map<String, dynamic> json) {
  return UserTemplate(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    coverPhoto: json['coverPhoto'] as String,
    sections: (json['sections'] as List)
        ?.map((e) =>
            e == null ? null : Section.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserTemplateToJson(UserTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverPhoto': instance.coverPhoto,
      'sections': instance.sections?.map((e) => e?.toJson())?.toList(),
    };
