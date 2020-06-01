// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_section_item_observation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionSectionItemObservation _$InspectionSectionItemObservationFromJson(
    Map<String, dynamic> json) {
  return InspectionSectionItemObservation(
    title: json['title'] as String,
    description: json['description'] as String,
    mediaUrl: json['mediaUrl'] as String,
  );
}

Map<String, dynamic> _$InspectionSectionItemObservationToJson(
        InspectionSectionItemObservation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'mediaUrl': instance.mediaUrl,
    };
