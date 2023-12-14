import 'package:example_t_pop/app/data/models/seating/seating_models.dart';

mixin SeatRepository {
  /// [SeatRepository] [SeatingModels]
  Future<SeatingModels?> seatingData();
}
