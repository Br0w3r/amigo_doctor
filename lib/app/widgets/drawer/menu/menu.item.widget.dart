import 'package:amigo_doctor/core/routes/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:amigo_doctor/core/common/exit_app.dart';
import 'package:amigo_doctor/app/widgets/text/title.widget.dart';
import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:amigo_doctor/app/widgets/button/custom_button_large.widget.dart';

class MenuItemDrawer extends StatelessWidget {
  final bool mainParent;

  const MenuItemDrawer({
    Key? key,
    required this.mainParent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width / 1.9,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTitle(
                title: "AJUSTES",
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeightDelta: 1,
                size: -3,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  FontAwesomeIcons.xmark,
                  color: Colors.black45,
                  size: 20,
                ),
              )
            ],
          ).paddingOnly(left: 15, right: 15, top: 25, bottom: 20),
          //_options("Notificaciones", () => {}),
          //_options("Configuración", () => {}),
          //_options("Privacidad y seguridad", () => {}),
          //_options("Administrar cuentas", () => {}),
          _options(
            "Administrar números",
            () => Get.toNamed(Routes.myPhones, parameters: {'isMenu': 'true'}),
          ),
          _options(
              "Opciones de pago",
              () => Get.toNamed('/viewCards',
                  parameters: {'appBarName': 'OPCIONES DE PAGO'})),
          //_options("Borrar caché", () => {}),
          CustomButtonLarge(
            text: "Cerrar sesión",
            onPressed: () => ExitApp.singOut(),
          ).paddingOnly(left: 10, right: 10, top: 20),
        ],
      ),
    );
  }

  _options(String title, Function route) {
    return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 7,
              child: CustomSubtitle(
                title: title,
                fontWeight: 2,
                size: 1,
                color: Colors.black45,
              ),
            ),
            const Expanded(
              flex: 2,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
              ),
            )
          ],
        ),
        onTap: () => route());
  }
}
