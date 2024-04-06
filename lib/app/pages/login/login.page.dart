import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/pages/login/login.controller.dart';
import 'package:amigo_doctor/app/widgets/loading/custom_loading.widget.dart';
import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:amigo_doctor/app/widgets/text/title.widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => controller.loading.value
            ? const CustomLoading(
                text: "Recuperando Datos...",
              )
            : SafeArea(
                child: _loginForm(context),
              ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _logo(),
        Align(
          alignment: Alignment.center,
          child: const CustomTitle(
            title: "Inicio de Sesión",
            size: 3,
            fontWeightDelta: 1,
            textAlign: TextAlign.center,
          ).paddingOnly(top: 30, bottom: 8, left: 10, right: 10),
        ),
        Align(
          alignment: Alignment.center,
          child: const CustomSubtitle(
            title: "Para poder continuar debes de entrar a tu cuenta de GITHUB",
            textAlign: TextAlign.center,
          ).paddingOnly(bottom: 25, left: 10, right: 10),
        ),
        GestureDetector(
          onTap: () => controller.sigIn(),
          child: SizedBox(
            width: Get.width,
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.github),
                    SizedBox(width: 20.0),
                    CustomSubtitle(
                      title: 'Entrar con GitHub',
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ).paddingOnly(left: 15, right: 15),
        ),
      ],
    );
  }

  Widget _logo() {
    return Image.asset(
      "assets/images/amigo-doctor-logo.png",
      width: 200,
    );
  }
}
