import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  static SnackbarController success(
    String? message, {
    title = 'Operación correcta',
    int durationSeconds = 4,
    Color colorStatus = Colors.lightGreen,
  }) =>
      _showSnack(
        message!,
        title,
        colorStatus: colorStatus,
        durationSeconds: durationSeconds,
      );

  static SnackbarController error(String message,
          {String title = "Advertencia", int durationSeconds = 4}) =>
      _showSnack(
        message,
        title,
        colorStatus: Colors.red,
        colorTitle: Colors.white,
        durationSeconds: durationSeconds,
      );

  static SnackbarController advertence(String message,
          {String title = "Advertencia", int durationSeconds = 4}) =>
      _showSnack(
        message,
        title,
        colorStatus: Colors.yellowAccent,
        durationSeconds: durationSeconds,
      );

  static SnackbarController _showSnack(String message, String title,
      {required Color colorStatus,
      Color colorTitle = Colors.black,
      int durationSeconds = 1}) {
    return Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: colorStatus,
      colorText: colorTitle,
      duration: Duration(
        seconds: durationSeconds,
      ),
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
    );
  }
}
