// ignore_for_file: invalid_use_of_protected_member
import 'package:example_t_pop/app/data/models/seat_layout/seat_layout_models.dart';
import 'package:example_t_pop/app/data/models/seating/seating_models.dart';
import 'package:example_t_pop/app/data/models/seats/seat_models.dart';
import 'package:example_t_pop/app/data/repository/seat_repository_impl.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController with StateMixin<SeatLayoutModels> {
  var character = ["A", "B", "C", "D", "E"];
  RxList<SeatModels> selectedSeat = <SeatModels>[].obs;
  late SeatingModels? seatingModels;
  var row = 0.obs;
  var column = 0.obs;
  var total = 0.obs;

  @override
  void onInit() async {
    await initializeIssue();
    super.onInit();
  }

  Future<void> initializeIssue() async {
    await getDataSeatRepository();
    await fetchTable();
  }

  Future<SeatingModels?> getDataSeatRepository() async {
    seatingModels = await SeatRepositoryImpl.instead.seatingData();
    row.value = seatingModels?.seatLayout?.rows ?? 0;
    column.value = seatingModels?.seatLayout?.column ?? 0;
    return seatingModels;
  }

  fetchTable() async {
    if (state != null) {
      change(null, status: RxStatus.loading());
    }
    final _response = seatingModels;
    if (_response!.seatLayout!.seats!.isEmpty) {
      change(
        null,
        status: RxStatus.empty(),
      );
    } else {
      change(
        _response.seatLayout,
        status: RxStatus.success(),
      );
    }
  }

  selectedMultipleItemSeat({required SeatModels seatNumber}) {
    selectedSeat.refresh();
    if (selectedSeat.value.contains(seatNumber)) {
      totalMinus();
      selectedSeat.value.remove(seatNumber);
    } else {
      selectedSeat.value.add(seatNumber);
      totalPlus();
    }
  }

  totalPlus() {
    for (var item in selectedSeat.value) {
      total.value += item.price;
    }
  }

  totalMinus() {
    for (var item in selectedSeat.value) {
      total.value -= item.price;
    }
  }
}
