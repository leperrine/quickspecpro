// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_observation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemObservation _$ItemObservationFromJson(Map<String, dynamic> json) {
  return ItemObservation(
    title: json['title'] as String,
    description: json['description'] as String,
    mediaUrl: json['mediaUrl'] as String,
  );
}

Map<String, dynamic> _$ItemObservationToJson(ItemObservation instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'mediaUrl': instance.mediaUrl,
    };
