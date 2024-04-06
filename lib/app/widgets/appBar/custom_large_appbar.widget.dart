import 'package:amigo_doctor/app/utils/decoration.utils.dart';
import 'package:amigo_doctor/app/widgets/text/title.widget.dart';
import 'package:flutter/material.dart';

class CustomLargeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? children;
  final double? sizeAppBar;

  const CustomLargeAppBar(
      {super.key, required this.title, this.children, this.sizeAppBar});

  @override
  Size get preferredSize => Size.fromHeight(sizeAppBar!);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            decoration: DecorationUtils.boxDecorationAppBar(context),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              shadowColor: Colors.transparent,
              centerTitle: true,
              iconTheme: Theme.of(context).iconTheme,
              title: CustomTitle(
                title: title,
                color: Colors.white,
                size: -2,
                textAlign: TextAlign.center,
              ),
              flexibleSpace: Center(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: children ?? [],
                ),
              ),
            )));
  }
}
