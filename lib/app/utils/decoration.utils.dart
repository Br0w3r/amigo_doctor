import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/utils/colors.utils.dart';

class DecorationUtils {
  static InputDecoration outLine(
    BuildContext context, {
    String? labelText,
    Color? labelColor,
    IconData? suffixIcon,
    Color? suffixIconColor = Colors.black,
    GestureTapCallback? onSuffixIconTap,
    bool? isReadlyOnly,
    Color? focusedBorderColor = Colors.black,
    Color? fillColor = Colors.white,
    IconData? prefixIcon,
    GestureTapCallback? onPrefixIconTap,
  }) {
    var themeDefault = Theme.of(context).colorScheme.outlineVariant;
    return InputDecoration(
      filled: true,
      fillColor: fillColor,
      suffixIcon: IconButton(
          icon: Icon(
            suffixIcon,
            color: suffixIconColor,
          ),
          onPressed: onSuffixIconTap),
      prefixIcon: prefixIcon != null
          ? IconButton(
              icon: Icon(
                prefixIcon,
                color: suffixIconColor,
              ),
              onPressed: onPrefixIconTap)
          : null,
      contentPadding: const EdgeInsets.all(15),
      labelStyle: Theme.of(context).textTheme.bodyMedium!.apply(
            fontWeightDelta: 0,
            color: labelColor,
          ),
      labelText: labelText,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[350]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        borderSide: BorderSide(
          color: isReadlyOnly ?? true
              ? Colors.grey[350]!
              : themeDefault.withOpacity(0.3),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: themeDefault),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: focusedBorderColor!),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context)
                .inputDecorationTheme
                .errorBorder!
                .borderSide
                .color,
            width: 2.3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context)
                .inputDecorationTheme
                .errorBorder!
                .borderSide
                .color
                .withOpacity(0.2),
            width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  static InputDecoration outLineTextWithClose(BuildContext context,
      {bool enableClose = false,
      GestureTapCallback? onClose,
      String labelText = ""}) {
    return InputDecoration(
        filled: true,
        fillColor: ColorsUtils.hexToColor('#0E0E13'),
        contentPadding: const EdgeInsets.all(15),
        suffixIcon: enableClose
            ? IconButton(
                icon: const Icon(Icons.cancel, color: Colors.white54),
                onPressed: onClose)
            : null,
        prefixIconColor: Colors.white70,
        suffixIconColor: Colors.white70,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white12, width: 2.0),
            borderRadius: BorderRadius.circular(15.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.5),
            borderRadius: BorderRadius.circular(15.0)),
        labelStyle: Theme.of(context).textTheme.titleSmall,
        labelText: labelText);
  }

  static InputDecoration outLineText(BuildContext context,
      {String labelText = "",
      Widget? trailing,
      Color? labelTextColor,
      double borderRadius = 0.0,
      Color? backgroundColor,
      Color? borderSideColor}) {
    var themeDefault = borderSideColor ?? Colors.black;
    return InputDecoration(
      filled: true,
      fillColor: backgroundColor ?? Colors.white,
      suffixIcon: trailing,
      contentPadding: const EdgeInsets.all(15),
      labelStyle: Theme.of(context).textTheme.bodyMedium!.apply(
            fontWeightDelta: 0,
            color: backgroundColor ?? Colors.black,
          ),
      labelText: labelText,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[350]!, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: themeDefault.withOpacity(0.3),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: themeDefault),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context)
                .inputDecorationTheme
                .errorBorder!
                .borderSide
                .color,
            width: 2.3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Theme.of(context)
                .inputDecorationTheme
                .errorBorder!
                .borderSide
                .color
                .withOpacity(0.2),
            width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      counterText: "",
    );
  }

  static InputDecoration outlineSearch(BuildContext context) {
    return const InputDecoration(
        prefixIcon: Icon(Icons.search, color: Colors.black38));
  }

  static BoxDecoration drawer(BuildContext context) {
    return BoxDecoration(shape: BoxShape.rectangle, boxShadow: <BoxShadow>[
      BoxShadow(
          color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.65),
          blurRadius: 5.5,
          offset: const Offset(6, 4),
          spreadRadius: 3.8)
    ]);
  }

  static BoxDecoration blurImage(BuildContext context) {
    return const BoxDecoration(
      shape: BoxShape.rectangle,
      image: DecorationImage(
        image: ExactAssetImage('assets/images/background.jpg'),
        fit: BoxFit.fitHeight,
        filterQuality: FilterQuality.high
      ),
    );
  }

  static RoundedRectangleBorder cardDecoration(BuildContext context) {
    return RoundedRectangleBorder(
        side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            style: BorderStyle.solid),
        borderRadius: const BorderRadius.all(Radius.circular(7)));
  }

  static RoundedRectangleBorder cardDecorationSimple(BuildContext context,
      {Color? color}) {
    return RoundedRectangleBorder(
        side: BorderSide(
            color: color ?? Theme.of(context).scaffoldBackgroundColor,
            style: BorderStyle.solid),
        borderRadius: const BorderRadius.all(Radius.circular(8)));
  }

  static RoundedRectangleBorder cardDecorationItems(BuildContext context) {
    return RoundedRectangleBorder(
        side: BorderSide(
            width: Get.width,
            color: Theme.of(context).scaffoldBackgroundColor,
            style: BorderStyle.solid),
        borderRadius: const BorderRadius.all(Radius.circular(20)));
  }

  static BoxDecoration customBoxDecoration(List<Color> colors,
      {bool isRounded = false}) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: colors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius:
          isRounded ? const BorderRadius.all(Radius.circular(10)) : null,
      // ignore: dead_code
    );
  }

  static BoxDecoration boxDecorationAppBar(BuildContext context) {
    return BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25),
        ),
        gradient: LinearGradient(colors: [
          Colors.black45.withOpacity(0.7),
          Theme.of(context).colorScheme.primary
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter));
  }

  static BoxDecoration boxDecorationAppBarDialog(BuildContext context) {
    return const BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      gradient: LinearGradient(
        colors: [Color(0xFF000000), Color(0xFF000000)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}
