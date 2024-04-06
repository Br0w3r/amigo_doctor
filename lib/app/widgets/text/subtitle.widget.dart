import 'package:flutter/material.dart';

class CustomSubtitle extends StatelessWidget {
  const CustomSubtitle({
    Key? key,
    required this.title,
    this.size = 0,
    this.color = Colors.black87,
    this.fontWeight = 2,
    this.textAlign = TextAlign.start,
    this.onPressed,
    this.content,
  }) : super(key: key);

  final String title;
  final double size;
  final Color color;
  final int fontWeight;
  final TextAlign textAlign;
  final VoidCallback? onPressed;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        title,
        textAlign: textAlign,
        textHeightBehavior: const TextHeightBehavior(
          leadingDistribution: TextLeadingDistribution.even,
        ),
        style: Theme.of(context).textTheme.bodySmall!.apply(
              fontSizeDelta: size,
              color: color,
              fontWeightDelta: fontWeight,
            ),
        overflow: TextOverflow.fade,
        maxLines: 15,
        softWrap: true,
        textWidthBasis: TextWidthBasis.parent,
      ),
    );
  }
}

