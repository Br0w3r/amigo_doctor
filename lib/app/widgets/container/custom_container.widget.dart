import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final List<Widget> children;
  final Color color;
  final IconData? icon;

  const CustomContainer({
    super.key,
    required this.children,
    this.labelText = "",
    this.icon,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CustomSubtitle(
                title: labelText,
                textAlign: TextAlign.center,
                color: Colors.black,
                size: 1,
                fontWeight: 2,
                // fontWeight: FontWeight.w500,
              ).paddingOnly(top: 4),
              ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: children)
            ]));
  }
}
