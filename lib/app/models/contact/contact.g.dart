// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    id: json['id'] as String,
    fullName: json['fullName'] as String,
    emailAddress: json['emailAddress'] as String,
    phoneNumber: json['phoneNumber'] as String,
    inspections:
        (json['inspections'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'inspections': instance.inspections,
    };
