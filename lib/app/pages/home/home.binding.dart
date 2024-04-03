import 'package:get/get.dart';
import 'package:amigo_doctor/app/pages/home/home.controller.dart';

class HomeBinding implements Bindings {
  //final ISimService iSimService;

  HomeBinding();

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
