import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageMemoryRounded extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Uint8List? image;
  final Color? color;
  final Rx<bool> loading;
  final double size;
  const CustomImageMemoryRounded(
      {super.key,
      this.onTap,
      required this.image,
      required this.loading,
      this.size = 55,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircleAvatar(
        radius: 50, // Image radius
        backgroundColor: color ??
            Theme.of(context).drawerTheme.backgroundColor!.withOpacity(0.70),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Visibility(
            visible: !loading(),
            replacement: Image.asset("assets/images/wait.gif"),
            child: Image.memory(
              image!,
              errorBuilder: (context, child, frame) => Icon(
                Icons.broken_image,
                color: Theme.of(context).unselectedWidgetColor,
              ),
              filterQuality: FilterQuality.medium,
              opacity: const AlwaysStoppedAnimation(10),
              fit: BoxFit.cover,
              scale: 1.5,
              height: size - 5,
              width: size - 5,
            ),
          ),
        ),
      ),
    );
  }
}
