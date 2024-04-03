import 'dart:convert';
import 'dart:core';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NumberParse on String {
  int toInt() {
    return int.parse(this);
  }

  String toEncrypt() {
    return md5.convert(utf8.encode(this)).toString();
  }

  String removeCharts() {
    return replaceAll(RegExp('[^A-Za-z0-9]'), '');
  }

  int removeLetters() {
    return replaceAll(RegExp('[^0-9]'), '').toInt();
  }

  String formatPhone() => replaceAllMapped(
      RegExp(r'(\d{2})(\d{2})(\d{2})(\d+)'),
      (Match m) => "${m[1]} ${m[2]} ${m[3]} ${m[4]}");

  String formatPhoneNumber() {
    final length = this.length;
    if (length == 10) {
      return '(${substring(0, 3)})${substring(3, 6)}-${substring(6)}';
    } else if (length == 14) {
      return '(${substring(4, 7)})${substring(7, 10)}-${substring(10)}';
    } else {
      // El número de teléfono no tiene un formato válido, se devuelve sin cambios.
      return this;
    }
  }

  String capitalizeAfterSpace() {
    List<String> words = split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() +
            (words[i].length > 1 ? words[i].substring(1).toLowerCase() : '');
      }
    }
    return words.join(' ');
  }

  String maskCard() {
    if (length >= 4) {
      String lastFourDigits = substring(length - 4);
      return '*' * (length - 12) + lastFourDigits;
    }
    return this;
  }
}

extension NumberFormateInt on int? {
  String formatPattern() =>
      NumberFormat.decimalPattern("es_MX").format(this ?? 0);
}

extension NumberFormateDouble on double? {
  String formatPattern() =>
      NumberFormat.decimalPattern("es_MX").format(this ?? 0);
}

extension NumberFormateNum on num? {
  String formatPattern() =>
      NumberFormat.decimalPattern("es_MX").format(this ?? 0);
}

extension DateFormating on DateTime {
  String formatDate() {
    return DateFormat("yyyy-MM-dd").format(this);
  }

  String formatHour() {
    return DateFormat("hh:mm aa").format(this);
  }

  String formatDateHour() {
    return DateFormat("yyyy-MM-dd hh:mm aa").format(this);
  }

  String formatDateNameMonth() {
    return DateFormat('dd MMMM yyyy', 'ES').format(this);
  }
}

extension DurationFormat on Duration {
  String prettyDuration() {
    var components = <String>[];

    var days = inDays;
    if (days != 0) {
      components.add('$days ${days == 1 ? "dia" : "dias"} con ');
    }
    var hours = inHours % 24;
    if (hours != 0) {
      components.add('$hours ${days == 1 ? "hora" : "horas"} y ');
    }
    var minutes = inMinutes % 60;
    if (minutes != 0) {
      components.add('$minutes ${minutes == 1 ? "minuto" : "minutos"}');
    }

/*    var seconds = this.inSeconds % 60;
    var centiseconds =
        (this.inMilliseconds % 1000) ~/ 10;
    if (components.isEmpty || seconds != 0 || centiseconds != 0) {
      components.add('$seconds');
      if (centiseconds != 0) {
        components.add('.');
        components.add(centiseconds.toString().padLeft(2, '0'));
      }
      components.add('s');
    }*/
    return components.join();
  }
}

//region extension widgets
/*
extension ScaffoldLoading on Scaffold {
  Widget mainScaffold(
      {Future<void> Function()? onRefresh,
      String title = "",
      required bool loading,
      required Widget body,
      Future<bool> Function()? onBack,
      Widget? bottomSheet,
      Widget? iconButton,
      Widget? bottomNavigationBar,
      Widget? floatingActionButton}) {
    return WillPopScope(
      onWillPop: onBack,
      child: RefreshIndicator(
        onRefresh: onRefresh ?? () async {},
        child: CustomLoading(
            loading,
            Scaffold(
           //   body: SimpleAppBar(title: title,child: body),
              bottomSheet: bottomSheet,
              floatingActionButton: floatingActionButton,
            )),
      ),
    );
  }
}*/

extension VisibilityWait on Visibility {
  Widget wait(
      {required Future<bool> visible,
      required Widget child,
      Widget? replacement}) {
    return FutureBuilder<bool>(
        future: visible,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data!) {
            return child;
          } else {
            return replacement ?? const Text("");
          }
        });
  }
}
//endregion
