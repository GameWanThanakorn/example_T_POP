// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_layout_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatLayoutModels _$SeatLayoutModelsFromJson(Map<String, dynamic> json) =>
    SeatLayoutModels(
      rows: json['rows'] as int?,
      column: json['columns'] as int?,
      seats: (json['seats'] as List<dynamic>?)
          ?.map((e) => SeatModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeatLayoutModelsToJson(SeatLayoutModels instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'columns': instance.column,
      'seats': instance.seats,
    };
