import 'package:json_annotation/json_annotation.dart';
import 'package:quickspecpro/app/models/template/item_feature.dart';

part 'section_item.g.dart';

@JsonSerializable()
class SectionItem {
  SectionItem({
    this.title,
    this.description,
    List<ItemFeature> itemFeatures,
  });
  final String title;
  final String description;
  List<ItemFeature> features;
  
  factory SectionItem.fromJson(Map<String, dynamic> json) => _$SectionItemFromJson(json);
  Map<String, dynamic> toJson() => _$SectionItemToJson(this);
  
}