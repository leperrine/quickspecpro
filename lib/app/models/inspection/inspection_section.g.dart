// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionSection _$InspectionSectionFromJson(Map<String, dynamic> json) {
  return InspectionSection(
    id: json['id'] as String,
    reportId: json['reportId'] as String,
    templateId: json['templateId'] as String,
    title: json['title'] as String,
    summary: json['summary'] as String,
  );
}

Map<String, dynamic> _$InspectionSectionToJson(InspectionSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reportId': instance.reportId,
      'templateId': instance.templateId,
      'title': instance.title,
      'summary': instance.summary,
    };
