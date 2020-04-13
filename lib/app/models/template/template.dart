import 'package:json_annotation/json_annotation.dart';

import 'package:quickspecpro/app/models/template/section.dart';

part 'template.g.dart';
@JsonSerializable(explicitToJson: true)
class Template {
Template({
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

  factory Template.fromJson(Map<String, dynamic> json) => _$TemplateFromJson(json);
  Map<String, dynamic> toJson() => _$TemplateToJson(this);
  
}