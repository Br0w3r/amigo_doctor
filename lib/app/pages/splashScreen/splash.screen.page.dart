// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/pages/splashScreen/splash.screen.controller.dart';
import 'package:amigo_doctor/app/utils/decoration.utils.dart';
import 'package:amigo_doctor/app/widgets/images/images_assets.widget.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoginPage = true;

    BoxDecoration scaffoldBackgroundDecoration = isLoginPage
        ?  DecorationUtils.blurImage(context)
        : const BoxDecoration();

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: scaffoldBackgroundDecoration,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: controller.animation.value,
                      child: child,
                    );
                  },
                  child: const CustomImageAssets(nameImage: "assets/images/amigo-doctor-logo.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
