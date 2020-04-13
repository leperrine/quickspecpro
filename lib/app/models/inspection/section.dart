import 'package:quickspecpro/app/models/inspection/section_item.dart';

import 'package:json_annotation/json_annotation.dart';

part 'section.g.dart';

@JsonSerializable()

class Section {
  Section({
    this.id,
    this.reportId,
    this.templateId,
    this.title,
    this.summary,
    List<SectionItem> sectionItems,
  });
  final String id;
  final String reportId;
  final String templateId;
  final String title;
  final String summary;
  List<SectionItem> sectionItems;

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}


