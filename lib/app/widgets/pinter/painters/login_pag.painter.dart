import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class LoginPagePainter extends CustomPainter {
  const LoginPagePainter();


  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();
    var theme = Theme.of(Get.context!).colorScheme;

    paint
      ..style = PaintingStyle.fill
      ..isAntiAlias=false
      ..color = theme.secondary
      ..shader = ui.Gradient.radial(
        Offset(size.width  *.2,size.height *.5),
        .5,
        [
          Theme.of(Get.context!).primaryColorLight.withOpacity(0.7),
          Theme.of(Get.context!).dividerColor.withOpacity(0.1),
        ]
    );

    path
      ..moveTo(size.width, size.height*.3)
      ..quadraticBezierTo(size.width / 1.49, size.height / 3.9 , size.width*.5, size.height * 0.1)
      ..quadraticBezierTo(size.width / 2.4, size.height / 30,size.width*.2, size.height * 0.03)
      ..quadraticBezierTo(size.width / 20, size.height / 21 , 0, 0)
      ..lineTo(size.width, 0)
      ..moveTo(size.width, size.height*.25)
      ..close();
    canvas.drawPath(path, paint);

    var paint2 = Paint();
    var path2 = Path();

   // path2.fillType=PathFillType.evenOdd;
    paint2
      ..color = theme.primary
      ..style = PaintingStyle.fill
      ..isAntiAlias=false
      ..shader = ui.Gradient.radial(
        Offset(size.width  *.2,size.height *.5),
        .5,
        [
          Theme.of(Get.context!).disabledColor,
          Theme.of(Get.context!).primaryColor.withOpacity(0.65),
        ]
    );

    path2
      ..moveTo(size.width, size.height*.25)
      ..quadraticBezierTo(size.width / 1.5, size.height / 4 , size.width*.4, size.height * 0.08)
      ..quadraticBezierTo(size.width / 3.2, size.height / 40,size.width*.1,size.height * 0.04)
      ..quadraticBezierTo(size.width / 33, size.height / 25 , size.width*.03, 0)
      ..lineTo(size.width, 0)
      ..moveTo(size.width, size.height*.2)
      ..close();
    canvas.drawPath(path2, paint2);

    path2
      ..moveTo(size.width*0, size.height*.8)
      ..quadraticBezierTo(size.width / 3, size.height / 1.3 , size.width*.5, size.height * 0.9)
      ..quadraticBezierTo(size.width / 1.8, size.height / 1.05,size.width*.7, size.height * 0.95)
      ..quadraticBezierTo(size.width / 1, size.height / 1.06 , size.width, size.height)
      ..lineTo(size.width*0, size.height)
      ..moveTo(size.width*0, size.height*.8)
      ..close();
    canvas.drawPath(path2, paint2);



  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
