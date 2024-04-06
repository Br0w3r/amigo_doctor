import 'package:flutter/material.dart';

class CustomDividerLight extends StatelessWidget {

  final double division;
  const CustomDividerLight({super.key,this.division=100});

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: Theme.of(context).primaryColor,
        endIndent: division,
        indent: division,
        thickness: 1.5,
        height: 20);
  }
}
