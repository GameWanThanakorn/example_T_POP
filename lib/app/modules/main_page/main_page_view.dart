// ignore_for_file: invalid_use_of_protected_member
import 'package:example_t_pop/app/data/models/seat_layout/seat_layout_models.dart';
import 'package:example_t_pop/app/data/models/seats/seat_models.dart';
import 'package:example_t_pop/app/modules/main_page/main_page_controller.dart';
import 'package:example_t_pop/app/modules/main_page/widget/card_seat_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageView extends GetView<MainPageController> {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LayoutBuilder(
          builder: (context, constraints) => Text(
            'เลือกที่นั่ง',
            style: TextStyle(fontSize: constraints.maxWidth / 14),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            controller.obx(
              onLoading: const Expanded(
                child: CupertinoActivityIndicator(),
              ),
              (state) {
                var row = state?.rows ?? 0;
                return Column(
                  children: [
                    cellIndexWidget(row),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          characterColumnWidget(),
                          const SizedBox(
                            width: 10,
                          ),
                          seatTableWidget(state),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    titleSeatWidget(),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => controller.selectedSeat.value.isNotEmpty
                          ? Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.symmetric(horizontal: 30),
                              child: wrapWidget(
                                alignment: WrapAlignment.start,
                                children: List.generate(
                                  controller.selectedSeat.value.length,
                                  (index) {
                                    return selectedSeatWidget(index);
                                  },
                                ),
                              ),
                            )
                          : LayoutBuilder(
                              builder: (context, constraints) => Padding(
                                    padding: EdgeInsets.only(top: constraints.maxWidth / 3.5),
                                    child: Text(
                                      'กรุณาเลือกที่นั่ง',
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth / 24,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )),
                    ),
                  ],
                );
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: const Text(
                    'ราคาทั้งหมด',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Obx(
                  () => Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Text(
                      "${controller.total.value} บาท",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Container selectedSeatWidget(int index) {
    return Container(
      height: 40,
      width: 70,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, mainAxisSize: MainAxisSize.min, children: [
        Text(
          controller.selectedSeat.value[index].seatNumber.toString(),
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            controller.totalMinus();
            controller.selectedSeat.remove(controller.selectedSeat.value[index]);
          },
          child: const Icon(
            Icons.close,
            size: 18,
            color: Colors.white,
          ),
        )
      ]),
    );
  }

  Widget wrapWidget({List<Widget>? children, WrapAlignment? alignment}) {
    return Wrap(
      alignment: alignment ?? WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: children ?? [],
    );
  }

  Widget titleSeatWidget({String? titie}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: LayoutBuilder(
        builder: (context, constraints) => Text(
          titie ?? 'ที่นั่ง',
          style: TextStyle(
            fontSize: constraints.maxWidth / 20,
          ),
        ),
      ),
    );
  }

  Widget cellIndexWidget(int row) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          row,
          (index) => Text(
            "${index + 1}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget characterColumnWidget() {
    return SizedBox(
      height: 270,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          controller.character.length,
          (index) => Text(
            controller.character[index],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget seatTableWidget(SeatLayoutModels? state) {
    return SizedBox(
      width: 300,
      child: wrapWidget(
        children: List.generate(
          state?.seats?.length ?? 0,
          (index) {
            return Obx(
              () => CardSeatWidget(
                onTap: () {
                  controller.selectedMultipleItemSeat(
                    seatNumber: state!.seats![index],
                  );
                },
                color: controller.selectedSeat.contains(state?.seats?[index] ?? SeatModels) ? Colors.yellow : Colors.grey.shade300,
              ),
            );
          },
        ),
      ),
    );
  }
}
