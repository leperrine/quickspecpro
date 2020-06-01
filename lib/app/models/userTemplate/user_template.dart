import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section.dart';

part 'user_template.g.dart';

@JsonSerializable(explicitToJson: true)
class UserTemplate {
  UserTemplate({
    @required this.id,
    @required this.title,
    @required this.description,
    this.coverPhoto,
  });
  final String id;
  final String title;
  final String description;
  final String coverPhoto;

  factory UserTemplate.fromJson(Map<String, dynamic> json, String documentId) =>
      _$UserTemplateFromJson(json);
  Map<String, dynamic> toJson() => _$UserTemplateToJson(this);
}
