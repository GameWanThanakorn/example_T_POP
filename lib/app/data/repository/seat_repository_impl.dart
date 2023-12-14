import 'package:example_t_pop/app/data/datasources/remote/seat_remote.dart';
import 'package:example_t_pop/app/data/models/seating/seating_models.dart';
import 'package:example_t_pop/app/domain/repositories/seat_repository.dart';
import 'package:get/get.dart';

class SeatRepositoryImpl with SeatRepository {
  static SeatRepositoryImpl get instead => Get.find<SeatRepositoryImpl>();
  static void initialize() {
    Get.lazyPut(
      () => SeatRepositoryImpl(
        remote: SeatRemoteDataSourcesImpl(),
      ),
      fenix: true,
    );
  }

  SeatRepositoryImpl({required SeatRemoteDataSourcesImpl remote}) : _remote = remote;
  final SeatRemoteDataSourcesImpl _remote;

  @override
  Future<SeatingModels?> seatingData() {
    return _remote.fetchDataSeating();
  }
}
