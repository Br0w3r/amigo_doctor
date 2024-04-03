import 'package:amigo_doctor/app/widgets/appBar/custom_single_appbar.widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:amigo_doctor/app/pages/home/home.controller.dart';
import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: CustomSingleAppBar(
          title: "Repositorios",
          leading: IconButton(onPressed: () => {}, icon:  Icon(Icons.menu)).paddingOnly(top: 5),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CustomSubtitle(
                title: "Home Page",
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
