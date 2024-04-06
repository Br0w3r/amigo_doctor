import 'package:amigo_doctor/app/pages/home/widgets/items_repos_widget.dart';
import 'package:amigo_doctor/app/widgets/appBar/custom_single_appbar.widget.dart';
import 'package:amigo_doctor/app/widgets/button/custom_button_large.widget.dart';
import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:amigo_doctor/app/widgets/text/title.widget.dart';
import 'package:amigo_doctor/app/widgets/text_fields/custom_text_field.widget.dart';
import 'package:amigo_doctor/core/common/exit_app.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:amigo_doctor/app/pages/home/home.controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomSingleAppBar(
          title: "Repositorios",
        ),
        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Obx(
                () => UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary),
                  accountName: CustomTitle(
                    title:
                        controller.firebaseUser.value!['displayName'] ?? 'S/N',
                    size: -5,
                    color: Colors.white,
                  ),
                  accountEmail: CustomSubtitle(
                    title: controller.firebaseUser.value!['email'],
                    color: Colors.white,
                  ),
                  currentAccountPicture:
                      Image.network(controller.firebaseUser.value!['photoURL']),
                ),
              ),
              CustomButtonLarge(
                text: "Cerrar Sesión",
                color: Colors.red[400],
                enable: true,
                onPressed: () => ExitApp.singOut(),
              ).paddingOnly(left: 10, right: 10, top: 10)
            ],
          ),
        ),
        body: Obx(() {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () => controller.onRefresh(),
            color: Colors.white,
            backgroundColor: const Color.fromARGB(255, 182, 39, 86),
            child: Column(children: [
              CustomTextField(
                "Buscar",
                controller.searcher(),
                onComplete: () => controller.onCompleteSearch(),
                onChange: (s) => controller.onCompleteSearch(),
              ).paddingAll(10),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: ListTile.divideTiles(
                      context: Get.context!,
                      color: Colors.transparent,
                      tiles: controller.userRepositoriesFill.map((element) =>
                          ItemReposWidget(
                              title: element['name'],
                              subtitle: element['html_url']))).toList(),
                ).paddingOnly(left: 5, right: 5),
              )
            ]),
          );
        }),
      ),
    );
  }
}
