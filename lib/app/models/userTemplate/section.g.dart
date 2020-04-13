// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) {
  return Section(
    id: json['id'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
    sectionItems: (json['sectionItems'] as List)
        ?.map((e) =>
            e == null ? null : SectionItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.summary,
      'sectionItems': instance.sectionItems,
    };
