import 'package:json_annotation/json_annotation.dart';

part 'inspection_section_item.g.dart';

@JsonSerializable()
class InspectionSectionItem {
  InspectionSectionItem({
    this.id,
    this.title,
    this.description,
  });
  final String id;
  final String title;
  final String description;

  factory InspectionSectionItem.fromJson(Map<String, dynamic> json) => _$InspectionSectionItemFromJson(json);
  Map<String, dynamic> toJson() => _$InspectionSectionItemToJson(this);
  
}