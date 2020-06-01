// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_section_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionSectionItem _$InspectionSectionItemFromJson(
    Map<String, dynamic> json) {
  return InspectionSectionItem(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$InspectionSectionItemToJson(
        InspectionSectionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
