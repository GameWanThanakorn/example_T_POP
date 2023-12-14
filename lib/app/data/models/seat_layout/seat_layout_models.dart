import 'package:example_t_pop/app/data/models/seats/seat_models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'seat_layout_models.g.dart';

@JsonSerializable()
class SeatLayoutModels {
  @JsonKey(name: 'rows')
  int? rows;
  @JsonKey(name: 'columns')
  int? column;
  @JsonKey(name: 'seats')
  List<SeatModels>? seats;

  SeatLayoutModels({this.rows, this.column, this.seats});

  factory SeatLayoutModels.fromJson(Map<String, dynamic> json) => _$SeatLayoutModelsFromJson(json);
}
