// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionAddress _$InspectionAddressFromJson(Map<String, dynamic> json) {
  return InspectionAddress(
    address: json['address'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    zip: json['zip'] as String,
  );
}

Map<String, dynamic> _$InspectionAddressToJson(InspectionAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
    };
