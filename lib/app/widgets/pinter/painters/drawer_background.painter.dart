import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';

class DrawerBackgroundPainter extends CustomPainter {
  const DrawerBackgroundPainter();
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();

    paint
      ..style = PaintingStyle.fill
      ..isAntiAlias = false
      ..shader =
          ui.Gradient.radial(Offset(size.width * .2, size.height * .5), .5, [
        Theme.of(Get.context!).primaryColorLight,
        Theme.of(Get.context!).dividerColor,
      ]);

    //region 1°st arc
    path
      ..moveTo(size.width * 0, size.height * 0.20)
      ..quadraticBezierTo(
          size.width / 2, size.height / 2.5, size.width, size.height * 0.12)
      ..lineTo(size.width, size.height * 0.08)
      ..quadraticBezierTo(size.width / 2, size.height / 2.5, size.width * 0,
          size.height * 0.15);
    canvas.drawPath(path, paint);

    path
      ..moveTo(size.width * .0, size.height * 0.30)
      ..quadraticBezierTo(
          size.width / 2, size.height / 2.5, size.width, size.height * 0.14)
      ..lineTo(size.width, size.height * 0.08)
      ..quadraticBezierTo(size.width / 2, size.height / 2.5, size.width * 0,
          size.height * 0.16);
    canvas.drawPath(path, paint);
    //endregion

    //region 2°dt arc
    path
      ..moveTo(size.width, size.height * 0.80)
      ..quadraticBezierTo(size.width / 2, size.height / 1.4, size.width * .0,
          size.height * 0.85)
      ..lineTo(size.width * .0, size.height * 0.9)
      ..quadraticBezierTo(
          size.width / 2, size.height / 1.4, size.width, size.height * 0.9);
    canvas.drawPath(path, paint);

    path
      ..moveTo(size.width, size.height * 0.90)
      ..quadraticBezierTo(size.width / 2, size.height / 1.4, size.width * .0,
          size.height * 0.87)
      ..lineTo(size.width * .0, size.height * 0.93)
      ..quadraticBezierTo(
          size.width / 2, size.height / 1.4, size.width, size.height * 0.93);
    canvas.drawPath(path, paint);

    //endregion
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
