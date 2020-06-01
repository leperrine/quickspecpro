// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTemplate _$UserTemplateFromJson(Map<String, dynamic> json) {
  return UserTemplate(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    coverPhoto: json['coverPhoto'] as String,
  );
}

Map<String, dynamic> _$UserTemplateToJson(UserTemplate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coverPhoto': instance.coverPhoto,
    };
