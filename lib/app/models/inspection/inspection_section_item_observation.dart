import 'package:json_annotation/json_annotation.dart';

part 'inspection_section_item_observation.g.dart';

@JsonSerializable()
class InspectionSectionItemObservation {
  InspectionSectionItemObservation({
    this.title,
    this.description,
    this.mediaUrl,
  });
  final String title;
  final String description;
  final String mediaUrl;

  factory InspectionSectionItemObservation.fromJson(Map<String, dynamic> json) => _$InspectionSectionItemObservationFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionSectionItemObservationToJson(this);
}