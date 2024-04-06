import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarPainter extends CustomPainter {
  const AppBarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var theme = Theme.of(Get.context!).colorScheme;
    Paint paint = Paint();
    Path path = Path();

    Rect pathGradientRect = Rect.fromCircle(
      center: Offset(size.width / 4, 0),
      radius: size.width / 1.4,
    );

    Gradient gradient = LinearGradient(
      colors: <Color>[
        theme.onBackground.withOpacity(1),
        theme.onSecondary.withOpacity(1),
      ],
      stops: const [
        0.3,
        1.0,
      ],
    );

    path
      ..lineTo(-size.width / 1.4, 0)
      ..quadraticBezierTo(
          size.width / 2, size.height * 2, size.width + size.width / 1.4, 0)
      ..close();
    paint
      ..color = theme.secondary
      ..shader = gradient.createShader(pathGradientRect)
      ..strokeWidth = 40;

    canvas.drawPath(path, paint);

//Second oval
    Rect secondOvalRect = Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.4, size.height / 1.5),
    );

    gradient = LinearGradient(
      colors: <Color>[
        theme.outline,
        theme.background,
      ],
      stops: const [
        0.0,
        1.0,
      ],
    );
    Paint secondOvalPaint = Paint()
      ..color = theme.primary
      ..shader = gradient.createShader(secondOvalRect);

    canvas.drawOval(secondOvalRect, secondOvalPaint);

//Third oval
    Rect thirdOvalRect = Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.4, size.height / 2.7),
    );

    gradient = LinearGradient(
      colors: <Color>[
        theme.outline,
        theme.background,
      ],
      stops: const [
        0.0,
        1.0,
      ],
    );
    Paint thirdOvalPaint = Paint()
      ..color = theme.primary
      ..shader = gradient.createShader(thirdOvalRect);

    canvas.drawOval(thirdOvalRect, thirdOvalPaint);

//Fourth oval
    Rect fourthOvalRect = Rect.fromPoints(
      Offset(-size.width / 2.4, -size.width / 1.875),
      Offset(size.width / 1.34, size.height / 1.14),
    );

    gradient = LinearGradient(
      colors: <Color>[
        theme.secondary.withOpacity(0.9),
        theme.background.withOpacity(0.9),
      ],
      stops: const [
        0.3,
        1.0,
      ],
    );
    Paint fourthOvalPaint = Paint()
      ..color = theme.primary
      ..shader = gradient.createShader(fourthOvalRect);

    canvas.drawOval(fourthOvalRect, fourthOvalPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
