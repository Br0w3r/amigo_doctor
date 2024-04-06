import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:amigo_doctor/app/widgets/text/title.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemReposWidget extends StatelessWidget {
  const ItemReposWidget({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).colorScheme.primary,
      child: ListTile(
        title: CustomTitle(
          title: title,
          color: Colors.white,
          size: -3,
        ).paddingOnly(bottom: 8),
        subtitle: CustomSubtitle(
          title: subtitle,
          color: Colors.white70,
        ),
      ),
    );
  }
}
