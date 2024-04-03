import 'package:flutter/material.dart';

class CustomDividerDark extends StatelessWidget {
  final double division;
  const CustomDividerDark({super.key, this.division=20});

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: Theme.of(context).dividerColor,
        endIndent: division,
        indent: division,
        thickness: 1.5,
        height: 20);
  }
}