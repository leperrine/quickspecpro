import 'package:json_annotation/json_annotation.dart';
import 'package:quickspecpro/app/models/template/section_item.dart';

part 'section.g.dart';

@JsonSerializable()

class Section {
  Section({
    this.id,
    this.title,
    this.summary,
    List<SectionItem> sectionItems,
  });
  final String id;
  final String title;
  final String summary;
  List<SectionItem> sectionItems;

  factory Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}


