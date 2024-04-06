import 'package:flutter/material.dart';

class CustomCircleIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color iconColor;
  final double? circleSize;
  final Color circleColor;
  final VoidCallback? onPressed;

  const CustomCircleIcon({
    super.key,
    required this.icon,
    this.size,
    this.iconColor = Colors.white,
    this.circleSize,
    this.circleColor = Colors.black,
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
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(2, 2), 
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
