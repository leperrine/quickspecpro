import 'package:json_annotation/json_annotation.dart';

import 'package:quickspecpro/app/models/userTemplate/section.dart';

part 'template.g.dart';
@JsonSerializable(explicitToJson: true)

class UserTemplate {
UserTemplate({
    this.id,
    this.title,
    this.description,
    this.coverPhoto,
    List<Section> sections,
  });
  final String id;
  final String title;
  final String description;
  final String coverPhoto;
  List<Section> sections;

  factory UserTemplate.fromJson(Map<String, dynamic> json) => _$UserTemplateFromJson(json);
  Map<String, dynamic> toJson() => _$UserTemplateToJson(this);
  
}