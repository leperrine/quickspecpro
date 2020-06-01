// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionAddress _$InspectionAddressFromJson(Map<String, dynamic> json) {
  return InspectionAddress(
    streetAddress: json['streetAddress'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zipCode: json['zipCode'] as String,
  );
}

Map<String, dynamic> _$InspectionAddressToJson(InspectionAddress instance) =>
    <String, dynamic>{
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
    };
