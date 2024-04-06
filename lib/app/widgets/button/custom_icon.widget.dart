import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget{
  final IconData icon;
  final Color? color;
  final GestureTapCallback? onPressed;
  final String? tooltip;
  final double size;

  const CustomIcon(this.icon,{super.key, this.tooltip,this.onPressed, this.size=27,this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon,size: size,color: color),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }

}