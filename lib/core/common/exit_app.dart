import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/utils/storage.utils.dart';
import 'package:amigo_doctor/core/routes/routes.dart';


class ExitApp {
  static Future<void> singOut() async {
    LocalStorageUtils.removeAll();
    return await Get.offAllNamed(Routes.splashScreen);
  }

  static Widget restoreApp() {
    return KeyedSubtree(
      key: UniqueKey(),
      child: Container(),
    );
  }
}
