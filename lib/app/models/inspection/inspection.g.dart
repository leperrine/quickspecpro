// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Inspection _$InspectionFromJson(Map<String, dynamic> json) {
  return Inspection(
    id: json['id'] as String,
    templateId: json['templateId'] as String,
    title: json['title'] as String,
    address: json['address'] == null
        ? null
        : InspectionAddress.fromJson(json['address'] as Map<String, dynamic>),
    description: json['description'] as String,
    coverPhoto: json['coverPhoto'] as String,
    inspectorName: json['inspectorName'] as String,
    inspectorLogo: json['inspectorLogo'] as String,
    ctaLink: json['ctaLink'] as String,
    ctaText: json['ctaText'] as String,
    sections: (json['sections'] as List)
        ?.map((e) =>
            e == null ? null : Section.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InspectionToJson(Inspection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'templateId': instance.templateId,
      'title': instance.title,
      'address': instance.address?.toJson(),
      'description': instance.description,
      'coverPhoto': instance.coverPhoto,
      'inspectorName': instance.inspectorName,
      'inspectorLogo': instance.inspectorLogo,
      'ctaLink': instance.ctaLink,
      'ctaText': instance.ctaText,
      'sections': instance.sections?.map((e) => e?.toJson())?.toList(),
    };
