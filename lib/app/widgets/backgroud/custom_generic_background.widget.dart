import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGenericBackGround extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;

  const CustomGenericBackGround({super.key, required this.child});

  @override
  Size get preferredSize => Size.fromHeight(Get.size.height * .3);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Stack(fit: StackFit.loose, children: <Widget>[
          child!,
          Container(
            width: preferredSize.width,
            height: preferredSize.height,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Theme.of(context).secondaryHeaderColor.withOpacity(0),
                      Theme.of(context).scaffoldBackgroundColor
                    ],
                    stops: const [
                      1.0,
                      0.5
                    ])),
          )
        ]));
  }
}
