import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
    this.size = 0,
    this.color = Colors.black87,
    this.fontWeightDelta = 1,
    this.textAlign = TextAlign.start,
    this.maxLines=3
  }) : super(key: key);

  final String title;
  final double size;
  final Color color;
  final int fontWeightDelta;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.titleSmall!.apply(
          fontSizeDelta: size, color: color, fontWeightDelta: fontWeightDelta),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      softWrap: false,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
