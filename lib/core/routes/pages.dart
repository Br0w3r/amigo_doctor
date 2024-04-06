import 'package:amigo_doctor/data/services/home/home.service.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/pages/home/home.binding.dart';
import 'package:amigo_doctor/app/pages/home/home.page.dart';
import 'package:amigo_doctor/app/pages/login/login.binding.dart';
import 'package:amigo_doctor/app/pages/login/login.page.dart';
import 'package:amigo_doctor/app/pages/splashScreen/splash.screen.binding.dart';
import 'package:amigo_doctor/app/pages/splashScreen/splash.screen.page.dart';
import 'package:amigo_doctor/core/routes/routes.dart';
import 'package:amigo_doctor/data/services/login/login.service.dart';
import 'package:amigo_doctor/data/services/user/user.service.dart';

abstract class Pages {
  static final loginApiService = LoginApiService();
  static final userApiService = UserApiService();
  static final homeApiService = HomeApiService();

  static final pages = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreenPage(),
        binding: SplashScreenBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding(loginApiService)),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding(homeApiService)),
  ];
}
