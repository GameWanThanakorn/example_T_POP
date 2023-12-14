import 'package:get/get.dart';

import 'main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() async {
    // Get.lazyPut<MainPageController>(
    //   () => MainPageController(),
    // );
    Get.put<MainPageController>(
      MainPageController(),
    );
  }
}
