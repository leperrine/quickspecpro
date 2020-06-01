import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_template_section.g.dart';

@JsonSerializable(explicitToJson: true)
class UserTemplateSection {
  UserTemplateSection({
    @required this.id,
    @required this.title,
    this.summary,
    List<String> userTemplateIds,
  }) : userTemplateIds = userTemplateIds ?? <String>[];
  final String id;
  final String title;
  final String summary;
  List<String> userTemplateIds;

  factory UserTemplateSection.fromJson(Map<String, dynamic> json, String documentId) =>
      _$UserTemplateSectionFromJson(json);
  Map<String, dynamic> toJson() => _$UserTemplateSectionToJson(this);
}
