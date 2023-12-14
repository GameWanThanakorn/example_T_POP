import 'package:json_annotation/json_annotation.dart';
part 'venue_models.g.dart';

@JsonSerializable()
class VenueModels {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'capacity')
  int? capacity;

  VenueModels({
    this.name,
    this.capacity,
  });

  factory VenueModels.fromJson(Map<String, dynamic> json) => _$VenueModelsFromJson(json);
}
