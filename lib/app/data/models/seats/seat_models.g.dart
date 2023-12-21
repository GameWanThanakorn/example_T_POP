// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatModels _$SeatModelsFromJson(Map<String, dynamic> json) => SeatModels(
      seatNumber: json['seatNumber'] as String?,
      status: json['status'] as String?,
      price: json['price'] as int? ?? 500,
    );

Map<String, dynamic> _$SeatModelsToJson(SeatModels instance) =>
    <String, dynamic>{
      'seatNumber': instance.seatNumber,
      'status': instance.status,
      'price': instance.price,
    };
