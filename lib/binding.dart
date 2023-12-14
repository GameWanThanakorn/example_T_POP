import 'package:example_t_pop/app/data/datasources/remote/seat_remote.dart';
import 'package:example_t_pop/app/data/repository/seat_repository_impl.dart';

class InitialBinding {
  static initialize() async {
    // /// Datasource
    // /// /// Seat Datasource
    SeatRemoteDataSourcesImpl.initialize();
    // /// Repository
    // /// /// Seat Repository
    SeatRepositoryImpl.initialize();
  }
}
