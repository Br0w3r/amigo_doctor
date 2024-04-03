import 'package:amigo_doctor/app/utils/decoration.utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? height;  

  const CustomCard(
      {super.key,
      required this.child,
      this.backgroundColor,
      this.borderColor,
      this.height}); 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .9,
      height: height != null ? Get.height * height! : null, 
      child: Card(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        shape:
            DecorationUtils.cardDecorationSimple(context, color: borderColor),
        semanticContainer: false,
        borderOnForeground: true,
        margin: const EdgeInsets.all(10),
        elevation: 2,
        child: child.paddingAll(10),
      ),
    );
  }
}

