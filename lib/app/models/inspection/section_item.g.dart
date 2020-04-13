// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionItem _$SectionItemFromJson(Map<String, dynamic> json) {
  return SectionItem(
    title: json['title'] as String,
    description: json['description'] as String,
    itemObservations: (json['itemObservations'] as List)
        ?.map((e) => e == null
            ? null
            : ItemObservation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..features = (json['features'] as List)
      ?.map((e) =>
          e == null ? null : ItemFeature.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$SectionItemToJson(SectionItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'features': instance.features,
      'itemObservations': instance.itemObservations,
    };
