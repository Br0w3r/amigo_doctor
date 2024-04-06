import 'dart:convert';

import 'package:amigo_doctor/app/utils/storage.utils.dart';
import 'package:amigo_doctor/core/values/keys.dart';
import 'package:amigo_doctor/data/services/home/home.contract.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  final RxList<dynamic> userRepositories = RxList<dynamic>();
  final RxList<dynamic> userRepositoriesFill = RxList<dynamic>();
  final loading = false.obs;
  final IHomeService iHomeService;
  final searcher = TextEditingController(text: "").obs;
  Rxn<Map<String, dynamic>> firebaseUser = Rxn<Map<String, dynamic>>();

  HomeController(this.iHomeService);

  @override
  void onInit() async {
    super.onInit();
    fetchRepositories();
    getDataUser();
  }

  Future getDataUser() async {
    String userJson = await LocalStorageUtils.getStringByKey(Keys.userInfo);

    Map<String, dynamic> userMap = json.decode(userJson);
    firebaseUser.value = userMap;
  }

  Future fetchRepositories() async {
    loading(true);
    try {
      final repos = await iHomeService.fetchUserRepositories();
      userRepositories.assignAll(repos);
      onCompleteSearch();
    } catch (e) {
      Get.snackbar('Error', 'No se pudieron cargar los repositorios');
    } finally {
      loading(false);
    }
  }

  onRefresh() async => await fetchRepositories();

  onCompleteSearch() {
    if (searcher.value.text.isEmpty) {
      userRepositoriesFill.value = userRepositories.toList();
    }

    // Convertimos el filtro a minúsculas para hacer una búsqueda insensible a mayúsculas
    final filtroLowerCase = searcher.value.text.toLowerCase();

    // Usamos el método where para filtrar la lista basado en el nombre
    userRepositoriesFill.value = userRepositories
        .where((item) => item["name"].toLowerCase().contains(filtroLowerCase))
        .toList();
  }
}
