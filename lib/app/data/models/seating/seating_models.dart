import 'package:example_t_pop/app/data/models/seat_layout/seat_layout_models.dart';
import 'package:example_t_pop/app/data/models/venue/venue_models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'seating_models.g.dart';

@JsonSerializable()
class SeatingModels {
  @JsonKey(name: 'venue')
  VenueModels? venue;
  @JsonKey(name: 'seatLayout')
  SeatLayoutModels? seatLayout;
  SeatingModels({
    this.venue,
    this.seatLayout,
  });

  factory SeatingModels.fromJson(Map<String, dynamic> json) => _$SeatingModelsFromJson(json);
}
