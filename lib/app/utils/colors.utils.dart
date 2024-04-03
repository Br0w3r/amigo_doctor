import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsUtils {
  static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }
  static  LinearGradient storyGradient = LinearGradient(
      begin:  Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Theme.of(Get.context!).primaryColor, Theme.of(Get.context!).primaryColor,]
  );
}