import 'package:json_annotation/json_annotation.dart';

import 'package:quickspecpro/app/models/inspection/inspection_address.dart';
import 'package:quickspecpro/app/models/inspection/section.dart';

part 'inspection.g.dart';

@JsonSerializable(explicitToJson: true)
class Inspection {
  Inspection({
    this.id,
    this.templateId,
    this.title,
    this.address,
    this.description,
    this.coverPhoto,
    this.inspectorName,
    this.inspectorLogo,
    this.ctaLink,
    this.ctaText,
    List<Section> sections,
  });
  final String id;
  final String templateId;
  final String title;
  final InspectionAddress address;
  final String description;
  final String coverPhoto;
  final String inspectorName;
  final String inspectorLogo;
  final String ctaLink;
  final String ctaText;
  List<Section> sections;

  factory Inspection.fromJson(Map<String, dynamic> json) => _$InspectionFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionToJson(this);
  
}