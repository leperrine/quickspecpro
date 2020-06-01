import 'package:json_annotation/json_annotation.dart';

part 'inspection_section.g.dart';

@JsonSerializable()

class InspectionSection {
  InspectionSection({
    this.id,
    this.reportId,
    this.templateId,
    this.title,
    this.summary,
  });
  final String id;
  final String reportId;
  final String templateId;
  final String title;
  final String summary;

  factory InspectionSection.fromJson(Map<String, dynamic> json) => _$InspectionSectionFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionSectionToJson(this);
}


