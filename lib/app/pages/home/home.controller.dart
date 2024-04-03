import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  //final ISimService iSimService;

  final loading = false.obs;

  HomeController();

  @override
  void onInit() async {
    super.onInit();
    loading(true);

    loading(false);
  }
}
