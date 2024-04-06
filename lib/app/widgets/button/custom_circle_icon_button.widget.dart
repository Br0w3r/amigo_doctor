import 'package:flutter/material.dart';

class CustomCircleIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final double circleSize;
  final Color circleColor;
  final VoidCallback? onPressed;
  final BorderSide? borderSide;

  const CustomCircleIcon({
    super.key,
    required this.icon,
    this.size = 24,
    this.iconColor = Colors.white,
    this.circleSize = 36,
    this.circleColor = Colors.red,
    this.borderSide,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: circleColor,
          border: borderSide == null ? null : Border.fromBorderSide(borderSide!),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0.5,
              blurRadius: 1.5,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Icon(
          icon,
          size: size,
          color: iconColor,
        ),
      ),
    );
  }
}
