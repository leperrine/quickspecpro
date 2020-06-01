import 'package:json_annotation/json_annotation.dart';

part 'inspection_address.g.dart';

@JsonSerializable()
class InspectionAddress {
  InspectionAddress({
    this.streetAddress,
    this.city,
    this.state,
    this.zipCode,
  });
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;

  factory InspectionAddress.fromJson(Map<String, dynamic> json) => _$InspectionAddressFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionAddressToJson(this);
}