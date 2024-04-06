
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:amigo_doctor/app/widgets/text/title.widget.dart';

class MsgUtils {
  static success(String message, {title = 'Operación correcta'}) {
    _showMessage(message, title: title);
  }

  static error(String message, {String title = 'Aviso'}) {
    _showMessage(message, title: title);
  }

  static _showMessage(String message, {String title = 'Mensaje'}) {
    Get.defaultDialog(title: title, middleText: message, actions: [
      ElevatedButton(
          onPressed: () => Get.back(),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          child: const Text(
            "Aceptar",
            style: TextStyle(color: Colors.white),
          ))
    ]);
  }

  static confirm(BuildContext context, String message, Function onConfirm,
      Function onCancel,
      {String title = 'Confirmación',
      String acceptText = 'Aceptar',
      String cancelText = 'Cancelar'}) async {
    final result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (builder) {
          return AlertDialog(
            title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
            content: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              _options(context, 'Cancelar', isCancel: false),
              _options(context, 'Aceptar',
                  isCancel: true,
                  color: Theme.of(context).colorScheme.background),
            ],
          );
        });

    if (result) {
      onConfirm();
    } else {
      onCancel();
    }
  }

  static Future<bool> exit(BuildContext context,
      {required GestureTapCallback onConfirm,
      String title = "Advertencia",
      String message = '¿Deseas Salir?'}) async {
    final result = await Get.dialog(AlertDialog(
      backgroundColor: Colors.white,
      title: CustomTitle(
        title: title,
        size: -3,
      ),
      content: CustomSubtitle(
        title: message,
        textAlign: TextAlign.start,
      ),
      actions: <Widget>[
        _options(context, 'No',
            isCancel: false, color: Theme.of(context).colorScheme.primary),
        _options(context, 'Si', isCancel: true),
      ],
    ));
    if (result) onConfirm();
    return result;
  }

  static TextButton _options(BuildContext context, String text,
      {bool isCancel = false, Color color = Colors.grey}) {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          textStyle: Theme.of(context).textTheme.bodyMedium,
        ),
        child: Text(text),
        onPressed: () {
          Navigator.of(context).pop(isCancel);
        });
  }
}
