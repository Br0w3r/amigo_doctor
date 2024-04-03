import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:amigo_doctor/app/utils/decoration.utils.dart';
import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:amigo_doctor/app/widgets/text/title.widget.dart';

class CustomDynamicAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool showLeading;
  final Rx<String> title;
  final double? sizeTitleAppBar;
  final String? subtitle;
  final double? sizeSubtitleAppBar;
  final List<Widget>? childrenFlexibleSpace;
  final IconData? icon;
  final VoidCallback? onIcondPressed;
  final bool isDialog;

  const CustomDynamicAppBar({
    Key? key,
    this.showLeading = false,
    required this.title,
    this.subtitle,
    this.sizeSubtitleAppBar = 4.0,
    this.childrenFlexibleSpace,
    this.sizeTitleAppBar = 8.0,
    this.icon,
    this.onIcondPressed,
    this.isDialog = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
            decoration: isDialog
                ? DecorationUtils.boxDecorationAppBarDialog(context)
                : DecorationUtils.boxDecorationAppBar(context),
            child: AppBar(
                leading: showLeading
                    ? null
                    : const SizedBox(width: 0.0, height: 0.0),
                elevation: 0.0,
                shadowColor: Colors.black,
                centerTitle: true,
                foregroundColor: Colors.black,
                surfaceTintColor: Colors.black,
                iconTheme: Theme.of(context).iconTheme.color == Colors.white
                    ? const IconThemeData(color: Colors.black)
                    : const IconThemeData(color: Colors.white),
                title: Obx(
                  () => Column(
                    children: [
                      CustomTitle(
                        title: title.value,
                        color: Colors.white,
                        size: sizeTitleAppBar!,
                        textAlign: TextAlign.center,
                        // maxCharacters: 40,
                      ),
                      if (subtitle != null)
                        CustomSubtitle(
                          title: subtitle!,
                          color: Colors.white,
                          size: sizeSubtitleAppBar!,
                          // textAlign: TextAlign.left,
                        ).paddingOnly(top: 2),
                    ],
                  ),
                ),
                actions: [
                  if (icon != null && onIcondPressed != null)
                    IconButton(
                      icon: Icon(icon),
                      onPressed: onIcondPressed,
                      color: Colors.white,
                    )
                ],
                flexibleSpace: childrenFlexibleSpace != null
                    ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: childrenFlexibleSpace!)
                        .paddingOnly(top: preferredSize.height / 2)
                        .paddingAll(10)
                    : null)));
  }

  @override
  Size get preferredSize => Size.fromHeight(childrenFlexibleSpace == null
      ? Get.size.height * .08
      : Get.size.height * .1);
}
