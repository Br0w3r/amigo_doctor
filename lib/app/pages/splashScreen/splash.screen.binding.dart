import 'package:get/get.dart';
import 'package:amigo_doctor/app/pages/splashScreen/splash.screen.controller.dart';


class SplashScreenBinding implements Bindings {
  //Put here Services

  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}
