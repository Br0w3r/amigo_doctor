import 'dart:math';

import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double value;
  final Color backgroundColor;
  final Color valueColor;
  final double strokeWidth;
  final String headerText;
  final String middleText;
  final String footerText;
  final TextStyle textStyleHeader;
  final TextStyle textStyleMiddle;
  final TextStyle textStyleFooter;

  const CustomCircularProgressIndicator({
    Key? key,
    required this.value,
    required this.backgroundColor,
    required this.valueColor,
    required this.strokeWidth,
    required this.headerText,
    required this.middleText,
    required this.footerText,
    required this.textStyleHeader,
    required this.textStyleMiddle,
    required this.textStyleFooter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: _CircularProgressIndicatorPainter(
          value: value,
          backgroundColor: backgroundColor,
          valueColor: valueColor,
          strokeWidth: strokeWidth,
          headerText: headerText,
          middleText: middleText,
          footerText: footerText,
          textStyleHeader: textStyleHeader,
          textStyleMiddle: textStyleMiddle,
          textStyleFooter: textStyleFooter,
        ),
      ),
    );
  }
}

class _CircularProgressIndicatorPainter extends CustomPainter {
  final double value;
  final Color backgroundColor;
  final Color valueColor;
  final double strokeWidth;
  final String headerText;
  final String middleText;
  final String footerText;
  final TextStyle textStyleHeader;
  final TextStyle textStyleMiddle;
  final TextStyle textStyleFooter;

  _CircularProgressIndicatorPainter({
    required this.value,
    required this.backgroundColor,
    required this.valueColor,
    required this.strokeWidth,
    required this.headerText,
    required this.middleText,
    required this.footerText,
    required this.textStyleHeader,
    required this.textStyleMiddle,
    required this.textStyleFooter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2.0;
    final Offset center = Offset(radius, radius);

    // Draw the background
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius - strokeWidth / 2.0, backgroundPaint);

    // Draw the progress arc
    final Paint progressPaint = Paint()
      ..color = valueColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final double sweepAngle = 2 * value * pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2.0),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );

    // Draw the header text
    final TextPainter headerTextPainter = TextPainter(
      text: TextSpan(text: headerText, style: textStyleHeader),
      textDirection: TextDirection.ltr,
    );
    headerTextPainter.layout();
    final Offset headerTextOffset = Offset(
      center.dx - headerTextPainter.width / 2.0,
      center.dy - headerTextPainter.height / 2.0 - 25, // Offset the header text vertically
    );
    headerTextPainter.paint(canvas, headerTextOffset);

    // Draw the middle text
    final TextPainter middleTextPainter = TextPainter(
      text: TextSpan(text: middleText, style: textStyleMiddle),
      textDirection: TextDirection.ltr,
    );
    middleTextPainter.layout();
    final Offset middleTextOffset = Offset(
      center.dx - middleTextPainter.width / 2.0,
      center.dy - middleTextPainter.height / 2.0,
    );
    middleTextPainter.paint(canvas, middleTextOffset);

    // Draw the footer text
    final TextPainter footerTextPainter = TextPainter(
      text: TextSpan(text: footerText, style: textStyleFooter),
      textDirection: TextDirection.ltr,
    );
    footerTextPainter.layout();
    final Offset footerTextOffset = Offset(
      center.dx - footerTextPainter.width / 2.0,
      center.dy - footerTextPainter.height / 2.0 + 25, // Offset the footer text vertically
    );
    footerTextPainter.paint(canvas, footerTextOffset);
  }

  @override
  bool shouldRepaint(_CircularProgressIndicatorPainter oldDelegate) {
    return true;
  }
}
