import 'package:json_annotation/json_annotation.dart';

import 'package:quickspecpro/app/models/inspection/item_feature.dart';
import 'package:quickspecpro/app/models/inspection/item_observation.dart';

part 'section_item.g.dart';

@JsonSerializable()
class SectionItem {
  SectionItem({
    this.title,
    this.description,
    List<ItemFeature> itemFeatures,
    List<ItemObservation> itemObservations,
  });
  final String title;
  final String description;
  List<ItemFeature> features;
  List<ItemObservation> itemObservations;

  factory SectionItem.fromJson(Map<String, dynamic> json) => _$SectionItemFromJson(json);
  Map<String, dynamic> toJson() => _$SectionItemToJson(this);
  
}