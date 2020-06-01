import 'package:json_annotation/json_annotation.dart';

import 'package:quickspecpro/app/models/inspection/inspection_address.dart';

part 'inspection.g.dart';

@JsonSerializable(explicitToJson: true)
class Inspection {
  Inspection({
    this.id,
    this.address,
    this.date,
    this.templateId,
    this.title,
    this.description,
    this.coverPhoto,
    this.inspectorName,
    this.inspectorLogo,
    this.ctaLink,
    this.ctaText,
  });
  final String id;
  final String templateId;
  final InspectionAddress address;
  final DateTime date;
  final String title;
  final String description;
  final String coverPhoto;
  final String inspectorName;
  final String inspectorLogo;
  final String ctaLink;
  final String ctaText;

  factory Inspection.fromJson(Map<String, dynamic> json, String documentId) => _$InspectionFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionToJson(this);
  
}