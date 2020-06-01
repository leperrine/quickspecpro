import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';
@JsonSerializable(explicitToJson: true)
class Contact {
  Contact({
    @required this.id,
    @required this.fullName,
    @required this.emailAddress,
    this.phoneNumber,
    this.inspections,
  });
  final String id;
  String fullName;
  String emailAddress;
  String phoneNumber;
  List<String> inspections;

  factory Contact.fromJson(Map<String, dynamic> json, String documentId) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
