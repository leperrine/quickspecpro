import 'package:json_annotation/json_annotation.dart';
import 'package:quickspecpro/app/models/userTemplate/user_template_section_item_feature.dart';

part 'user_template_section_item.g.dart';

@JsonSerializable(explicitToJson: true)
class UserTemplateSectionItem {
  UserTemplateSectionItem({
    this.id,
    this.title,
    this.description,
    List<UserTemplateSectionItemFeature> userTemplateSectionItemFeatures,
  }): userTemplateSectionItemFeatures = userTemplateSectionItemFeatures ?? <UserTemplateSectionItemFeature>[];
  final String id;
  final String title;
  final String description;
  List<UserTemplateSectionItemFeature> userTemplateSectionItemFeatures;
  
  factory UserTemplateSectionItem.fromJson(Map<String, dynamic> json, String documentId) => _$UserTemplateSectionItemFromJson(json);
  Map<String, dynamic> toJson() => _$UserTemplateSectionItemToJson(this);
  
}