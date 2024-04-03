
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/core/routes/routes.dart';

class CustomImageNetWork extends StatelessWidget {
  final String imageUrl;
  final String? route;
  final String? tooltip;
  final double size;

  const CustomImageNetWork(
      {super.key,
      required this.imageUrl,
      this.tooltip,
      this.route,
      this.size = 0.5});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.toNamed(route ?? Routes.home),
        child: SizedBox(
            width: (Get.size.width * size / 3),
            height: (Get.size.height * size / 4),
            child: Tooltip(
                message: tooltip ?? "",
                child: Image.network(imageUrl,
                    scale: 1.5,
                    filterQuality: FilterQuality.medium,
                    opacity: const AlwaysStoppedAnimation(10),
                    fit: BoxFit.fill,
                    width: Get.size.width * size / 3.2,
                    height: Get.size.height * size / 6.5,
                    loadingBuilder: (context, child, frame) =>
                        Image.asset("assets/images/wait.gif"),
                    errorBuilder: (context, child, frame) => Icon(
                        Icons.broken_image,
                        color: Theme.of(context).unselectedWidgetColor,
                        size: size * 70)))));
  }
}
