import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonLarge extends StatelessWidget {
  const CustomButtonLarge({
    Key? key,
    required this.text,
     this.onPressed,
    this.color,
    this.borderRadius,
    this.enable = false,
    this.height,
    this.sizeText = 2.5,
    this.width,
    this.textColor
  }) : super(key: key);

  final GestureTapCallback? onPressed;
  final String text;
  final Color? color;
  final double sizeText;
  final double? width;
  final Color? textColor;
  final bool enable;
  final double? borderRadius;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = width ?? Get.width;
    return Container(
      height: Get.height * .055,
      width: buttonWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: _generateStyle(context),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: CustomSubtitle(
            title: text,
            color: textColor??Colors.white,
            fontWeight: 2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
  ButtonStyle _generateStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColorLight,
        disabledBackgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 20)),
        fixedSize: Size.fromHeight(height ?? 0),
        maximumSize: Size.fromHeight((height ?? 0)*2),
        minimumSize: Size.fromHeight((height ?? 0)/2)
    );
  }
}
