import 'package:amigo_doctor/data/services/home/home.contract.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/pages/home/home.controller.dart';

class HomeBinding implements Bindings {
  //final ISimService iSimService;
  final IHomeService homeService;

  HomeBinding(
    this.homeService
  );

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(homeService));
  }
}
