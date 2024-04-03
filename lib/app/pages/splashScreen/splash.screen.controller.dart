import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/animation.dart';
import 'package:amigo_doctor/app/utils/storage.utils.dart';
import 'package:amigo_doctor/core/routes/routes.dart';
import 'package:amigo_doctor/core/values/keys.dart';
import 'package:amigo_doctor/data/models/entities/user/userProfile.model.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final userInfo = UserProfileModel().obs;
  final textCargando = "CARGANDO ...".obs;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.7, end: 0.5),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.5, end: 0.7),
        weight: 1,
      ),
    ]).animate(animationController);
    _getUserInfo();
    _loadingSplash();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  Future<UserProfileModel> _getUserInfo() async {
    var localUserInfo = await LocalStorageUtils.getStringByKey(Keys.userInfo);

    if (localUserInfo.isNotEmpty) {
      userInfo.value = UserProfileModel.fromJson(jsonDecode(localUserInfo));
    }

    return userInfo.value;
  }

  _loadingSplash() async {
    await animationController.forward().whenComplete(() {
      if (userInfo.value.username != null) {
        Get.offAllNamed(Routes.mainParent);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }
}
