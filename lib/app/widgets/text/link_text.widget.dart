import 'package:flutter/material.dart';

class LinkText extends StatelessWidget{
  final String text;
  final Color? color;
  final GestureTapCancelCallback? onPressed;
  final double size;
  const LinkText({super.key, required this.text, this.color, this.size=13.5, this.onPressed});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
        child: Text(text,
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: size,
              color: color??Colors.blue),
          strutStyle: const StrutStyle(fontSize: 10),
          overflow: TextOverflow.fade,
          maxLines: 3,
          softWrap: true,
          textWidthBasis: TextWidthBasis.parent,
        ));
  }
}