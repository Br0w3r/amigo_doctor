import 'package:get/get.dart';
import 'package:amigo_doctor/app/pages/login/login.controller.dart';
import 'package:amigo_doctor/data/services/login/login.contract.dart';

class LoginBinding implements Bindings {
  //Put here Services
  final ILoginService iLoginService;

  LoginBinding(this.iLoginService);

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(iLoginService));
  }
}
