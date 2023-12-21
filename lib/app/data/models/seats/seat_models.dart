import 'package:json_annotation/json_annotation.dart';
part 'seat_models.g.dart';

@JsonSerializable()
class SeatModels {
  @JsonKey(name: 'seatNumber')
  String? seatNumber;
  @JsonKey(name: 'status')
  String? status;
  int price;

  SeatModels({
    this.seatNumber,
    this.status,
    this.price = 500,
  });

  factory SeatModels.fromJson(Map<String, dynamic> json) => _$SeatModelsFromJson(json);
}
