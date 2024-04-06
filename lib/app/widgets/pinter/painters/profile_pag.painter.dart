import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class ProfilePagePainter extends CustomPainter {
  const ProfilePagePainter();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();

    paint
      ..style = PaintingStyle.fill
      ..isAntiAlias = false
      ..shader = ui.Gradient.radial(
          Offset(size.width * .2, size.height * .5),
          .5, [
        Theme.of(Get.context!).primaryColorLight,
        Theme.of(Get.context!).dividerColor,
      ]);

    path
      ..moveTo(size.width * .15, size.height)
      ..quadraticBezierTo(size.width / 3, size.height / 1.4, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height * 0.75)
      ..quadraticBezierTo(size.width / 3, size.height / 1.4, size.width * .25, size.height);

    canvas.drawPath(path, paint);

    path
      ..moveTo(size.width * .25, size.height)
      ..quadraticBezierTo(size.width / 3, size.height / 1.4, size.width, size.height * 0.75)
      ..lineTo(size.width, size.height * 0.8)
      ..quadraticBezierTo(size.width / 3, size.height / 1.4, size.width * .3, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
