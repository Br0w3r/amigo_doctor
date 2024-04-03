import 'package:amigo_doctor/app/widgets/pinter/painters/app_bar.painter.dart';
import 'package:amigo_doctor/app/widgets/pinter/painters/drawer_background.painter.dart';
import 'package:amigo_doctor/app/widgets/pinter/painters/login_pag.painter.dart';
import 'package:amigo_doctor/app/widgets/pinter/painters/profile_pag.painter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCustomPainter {
  static Widget loginPage({required Widget child}) {
    return CustomPaint(
        isComplex: false,
        willChange: false,
        size: Get.size,
        painter: const LoginPagePainter(),
        // foregroundPainter: const PackagesPainter(),
        child: child);
  }

  static Widget appBar({required Widget child}) {
    return CustomPaint(
        size: Size.zero, painter: const AppBarPainter(), child: child);
  }

  static Widget profilePage({required Widget child}) {
    return CustomPaint(
        size: Size.infinite, painter: const ProfilePagePainter(), child: child);
  }

  static Widget drawerBackground({required Widget child}) {
    return CustomPaint(
        size: Size.zero,
        painter: const DrawerBackgroundPainter(),
        child: child);
  }
}
