import 'package:example_t_pop/app/routes/app_pages.dart';
import 'package:example_t_pop/binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'app/core/widget/initialize_ui.dart';

void main() async {
  String env = ".env";
  await dotenv.load(fileName: env);
  WidgetsFlutterBinding.ensureInitialized();
  InitializeUI().init();
  await InitialBinding.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        dialogTheme: const DialogTheme(
          backgroundColor: Colors.black,
          iconColor: Colors.black,
        ),
      ),
      //Route
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      transitionDuration: const Duration(milliseconds: 300),
      debugShowCheckedModeBanner: false,
    );
  }
}
