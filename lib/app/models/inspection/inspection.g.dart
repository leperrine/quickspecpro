// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inspection _$InspectionFromJson(Map<String, dynamic> json) {
  return Inspection(
    id: json['id'] as String,
    address: json['address'] == null
        ? null
        : InspectionAddress.fromJson(json['address'] as Map<String, dynamic>),
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    templateId: json['templateId'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    coverPhoto: json['coverPhoto'] as String,
    inspectorName: json['inspectorName'] as String,
    inspectorLogo: json['inspectorLogo'] as String,
    ctaLink: json['ctaLink'] as String,
    ctaText: json['ctaText'] as String,
  );
}

Map<String, dynamic> _$InspectionToJson(Inspection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'templateId': instance.templateId,
      'address': instance.address?.toJson(),
      'date': instance.date?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'coverPhoto': instance.coverPhoto,
      'inspectorName': instance.inspectorName,
      'inspectorLogo': instance.inspectorLogo,
      'ctaLink': instance.ctaLink,
      'ctaText': instance.ctaText,
    };
