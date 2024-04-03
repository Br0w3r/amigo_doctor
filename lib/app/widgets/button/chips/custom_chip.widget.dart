import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String title;

  const CustomChip({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: Chip(
          label: Text(title,
              maxLines: 2, softWrap: true, overflow: TextOverflow.visible),
          labelStyle: Theme.of(context).textTheme.bodyMedium!,
          backgroundColor: Colors.white38,
        ));
  }
}
