import 'package:json_annotation/json_annotation.dart';
part 'seat_models.g.dart';

@JsonSerializable()
class SeatModels {
  @JsonKey(name: 'seatNumber')
  String? seatNumber;
  @JsonKey(name: 'status')
  String? status;

  SeatModels({
    this.seatNumber,
    this.status,
  });

  factory SeatModels.fromJson(Map<String, dynamic> json) => _$SeatModelsFromJson(json);
}
