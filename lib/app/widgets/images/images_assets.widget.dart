import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageAssets extends StatelessWidget {
  const CustomImageAssets({
    Key? key,
    required this.nameImage,
    this.height = 0.15,
    this.width = 0.15,
    this.boxFit,
  }) : super(key: key);

  final double height;
  final double width;
  final String nameImage;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        size: Size(Get.width * width, Get.height * height),
        child: Image.asset(nameImage, fit: boxFit));
  }
}
