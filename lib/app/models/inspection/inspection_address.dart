import 'package:json_annotation/json_annotation.dart';

part 'inspection_address.g.dart';

@JsonSerializable()
class InspectionAddress {
  InspectionAddress({
    this.address,
    this.city,
    this.state,
    this.zip,
  });
  final String address;
  final String city;
  final String state;
  final String zip;

  factory InspectionAddress.fromJson(Map<String, dynamic> json) => _$InspectionAddressFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionAddressToJson(this);
}