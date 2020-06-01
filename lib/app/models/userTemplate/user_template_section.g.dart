// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_template_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTemplateSection _$UserTemplateSectionFromJson(Map<String, dynamic> json) {
  return UserTemplateSection(
    id: json['id'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
    userTemplateIds:
        (json['userTemplateIds'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserTemplateSectionToJson(
        UserTemplateSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'userTemplateIds': instance.userTemplateIds,
    };
