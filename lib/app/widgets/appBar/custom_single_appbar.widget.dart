import 'package:amigo_doctor/app/utils/decoration.utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:amigo_doctor/app/widgets/text/title.widget.dart';

class CustomSingleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? childrenFlexibleSpace;
  final List<Widget>? trailing;

  const CustomSingleAppBar(
      {super.key,
      this.leading,
      this.title,
      this.childrenFlexibleSpace,
      this.trailing});

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
            foregroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: leading,
            actions: trailing,
            iconTheme: Theme.of(context).iconTheme,
            title: CustomTitle(
              title: title!,
              color: Colors.white,
              size: -3.5,
              textAlign: TextAlign.center,
            ),
            flexibleSpace: childrenFlexibleSpace != null
                ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: childrenFlexibleSpace!)
                    .paddingOnly(top: preferredSize.height / 2.2)
                    .paddingAll(10)
                : null),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(childrenFlexibleSpace == null
      ? Get.size.height * .07
      : Get.size.height * .1);
}
