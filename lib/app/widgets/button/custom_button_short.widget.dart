import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:flutter/material.dart';

class CustomButtonShort extends StatelessWidget {
  const CustomButtonShort({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.sizeText = 2.5,
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final Color color;
  final double sizeText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 150,
        child: LimitedBox(
          maxWidth: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ElevatedButton(
              onPressed: () => onPressed(),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(defineColor(context)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: CustomSubtitle(
                  title: text,
                  size: sizeText,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color defineColor(BuildContext context) {
    if (color == Colors.blue) {
      return Theme.of(context).primaryColorLight;
    } else {
      return color;
    }
  }
}
