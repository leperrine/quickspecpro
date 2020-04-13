import 'package:json_annotation/json_annotation.dart';

part 'item_observation.g.dart';

@JsonSerializable()
class ItemObservation {
  ItemObservation({
    this.title,
    this.description,
    this.mediaUrl,
  });
  final String title;
  final String description;
  final String mediaUrl;

  factory ItemObservation.fromJson(Map<String, dynamic> json) => _$ItemObservationFromJson(json);
  Map<String, dynamic> toJson() => _$ItemObservationToJson(this);
}