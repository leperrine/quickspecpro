import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

import 'package:quickspecpro/app/models/userTemplate/section.dart';

part 'template.g.dart';
@JsonSerializable(explicitToJson: true)

class UserTemplate {
UserTemplate({
    @required this.id,
    @required this.title,
    @required this.description,
    this.coverPhoto,
    List<Section> sections,
  }) : sections = sections ?? <Section>[];
  final String id;
  final String title;
  final String description;
  final String coverPhoto;
  List<Section> sections;

  factory UserTemplate.fromJson(Map<String, dynamic> json, String documentId) => _$UserTemplateFromJson(json);
  Map<String, dynamic> toJson() => _$UserTemplateToJson(this);
  
}