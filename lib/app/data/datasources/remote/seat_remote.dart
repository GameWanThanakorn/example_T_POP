import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:example_t_pop/app/core/config/configs.dart';
import 'package:example_t_pop/app/data/models/seating/seating_models.dart';
import 'package:get/get.dart';

mixin SeatRemoteDataSources {
  /// [SeatRemoteDataSources] [SeatingModels]
  Future<SeatingModels?> fetchDataSeating();
}

class SeatRemoteDataSourcesImpl with SeatRemoteDataSources {
  SeatRemoteDataSourcesImpl();
  static void initialize() {
    Get.lazyPut<SeatRemoteDataSources>(
      () => SeatRemoteDataSourcesImpl(),
      fenix: true,
    );
  }

  @override
  Future<SeatingModels?> fetchDataSeating() async {
    try {
      Dio dio = Dio();
      final path = Configs.pathSeating;
      final res = await dio.get(
        (Configs.exampleURl + path).toString(),
      );
      if (res.data != null || res.statusCode == 200) {
        return SeatingModels.fromJson(
          res.data,
        );
      }
    } on DioException catch (e) {
      log("{$e.toString()}", error: e);
    }
    return null;
  }
}
