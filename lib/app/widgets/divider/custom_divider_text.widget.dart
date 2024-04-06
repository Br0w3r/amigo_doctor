import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:flutter/material.dart';

class CustomDividerText extends StatelessWidget {
  final String text;
  final Color? color;
  const CustomDividerText({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    var validateColor = color ?? Theme.of(context).primaryColorLight;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Divider(
                endIndent: 25,
                color: validateColor,
                thickness: 1.5,
                height: 20),
          ),
          Flexible(
            child: CustomSubtitle(
                title: text,
                color: validateColor,
                size: 2,
                fontWeight: FontWeight.w400.index),
          ),
          Flexible(
            child: Divider(
              indent: 25,
                color: validateColor,
                thickness: 1.5,
                height: 20),
          ),
        ]);
  }
}
