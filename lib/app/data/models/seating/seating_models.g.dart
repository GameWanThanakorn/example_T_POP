// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seating_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeatingModels _$SeatingModelsFromJson(Map<String, dynamic> json) =>
    SeatingModels(
      venue: json['venue'] == null
          ? null
          : VenueModels.fromJson(json['venue'] as Map<String, dynamic>),
      seatLayout: json['seatLayout'] == null
          ? null
          : SeatLayoutModels.fromJson(
              json['seatLayout'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeatingModelsToJson(SeatingModels instance) =>
    <String, dynamic>{
      'venue': instance.venue,
      'seatLayout': instance.seatLayout,
    };
