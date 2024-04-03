import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading extends StatelessWidget {
  final double size;
  final String? text;

  const CustomLoading({Key? key, this.size = 100, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.inkDrop(
              color: Theme.of(context).primaryColorLight,
              size: size,
            ),
            text != null
                ? text!.isNotEmpty
                    ? Text(text!).paddingOnly(top: 50)
                    : Container()
                : Container()
          ],
        ));
  }
}
