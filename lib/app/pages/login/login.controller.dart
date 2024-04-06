import 'package:get/get.dart';
import 'package:amigo_doctor/app/utils/snackBar.utils.dart';
import 'package:amigo_doctor/app/utils/storage.utils.dart';
import 'package:amigo_doctor/core/routes/routes.dart';
import 'package:amigo_doctor/core/values/keys.dart';
import 'package:amigo_doctor/data/services/login/login.contract.dart';

class LoginController extends GetxController {
  final ILoginService _loginService;

  final loading = false.obs;

  LoginController(this._loginService);

  @override
  void onInit() async {
    super.onInit();

    loading.value = true;
  }

  @override
  void onReady() async {
    super.onReady();

    var token = await LocalStorageUtils.getStringByKey(Keys.tokenUser);

    if (token.isNotEmpty) {
      loading.value = false;
      return Get.offAndToNamed(Routes.home);
    }

    loading.value = false;
  }

  sigIn() async {
    loading.value = true;

    bool isSuccess = await _loginService.signIn();

    if (isSuccess) {
      loading.value = false;
      SnackBarUtils.success("Bienvenido nos alegramos de verte de nuevo. ");
      return Get.offAndToNamed(Routes.home);
    }

    loading.value = false;
  }
}
