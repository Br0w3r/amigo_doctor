import 'package:amigo_doctor/app/utils/decoration.utils.dart';
import 'package:amigo_doctor/core/values/validation_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

// ignore: must_be_immutable
class CustomReactiveTextField extends StatelessWidget {
  final String controlName;
  late final String labelText;
  late Color? labelColors = Colors.black;
  final TextInputType? keyboard;
  final int? maxLength;
  final int? minLength;
  final int? maxLines;
  final int? minLines;
  final bool isPass;
  final bool? isActive;
  final IconData? iconSuffix;
  final Color? iconSuffixColor;
  final void Function(FormControl<dynamic>)? onSubmitted;
  final void Function(FormControl<dynamic>)? onChanged;
  final GestureTapCallback? onSuffixIconTap;
  final Color? focusedBorderColor;
  final TextEditingController textEditing = TextEditingController(text: "");
  final InputDecoration? decoration;
  final String? isNotMatch;
  final double? customPadding;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final IconData? iconPrefix;
  final GestureTapCallback? onPrefixIconTap;

  CustomReactiveTextField(
    this.controlName, {
    super.key,
    this.labelText = "",
    this.labelColors,
    this.isActive,
    this.maxLength,
    this.minLength,
    this.onSubmitted,
    this.iconSuffix,
    this.iconSuffixColor,
    this.onSuffixIconTap,
    this.focusedBorderColor = Colors.black,
    this.maxLines,
    this.minLines,
    this.isPass = false,
    this.decoration,
    this.isNotMatch,
    this.keyboard,
    this.customPadding = 8.0,
    this.inputFormatters,
    this.onChanged,
    this.fillColor,
    this.iconPrefix,
    this.onPrefixIconTap,
  }) {
    if (labelText.isEmpty) labelText = controlName;
    /* textEditing.addListener(() {
      if(maxLength!=null)
        if (textEditing.text.length > maxLength!) {
          textEditing.text = textEditing.text.substring(0,maxLength);
        }});*/
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(customPadding!),
      child: ReactiveTextField(
        formControlName: controlName,
        controller: textEditing,
        autofocus: false,
        autocorrect: false,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        scribbleEnabled: isActive ?? true,
        enableInteractiveSelection: isActive ?? true,
        readOnly: !(isActive ?? true),
        inputFormatters: inputFormatters,
        textCapitalization: inputFormatters != null
            ? TextCapitalization.characters
            : TextCapitalization.none,
        enableIMEPersonalizedLearning: false,
        enableSuggestions: false,
        focusNode: isActive != null ? AlwaysDisabledFocusNode() : null,
        maxLines: maxLines ?? 1,
        minLines: minLines ?? 1,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        maxLength: maxLength,
        buildCounter: (
          context, {
          required currentLength,
          required isFocused,
          maxLength,
        }) =>
            null,
        validationMessages: validationMessages(
          minLength,
          maxLength,
          equals: isNotMatch ?? "",
        ),
        keyboardType: keyboard,
        style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: labelColors,
              overflow: TextOverflow.ellipsis,
            ),
        decoration: decoration ??
            DecorationUtils.outLine(
              context,
              labelText: labelText,
              labelColor: labelColors,
              onSuffixIconTap: onSuffixIconTap,
              suffixIcon: iconSuffix,
              suffixIconColor: iconSuffixColor,
              isReadlyOnly: isActive ?? true,
              focusedBorderColor: focusedBorderColor,
              fillColor: fillColor,
              prefixIcon: iconPrefix,
              onPrefixIconTap: onPrefixIconTap,
            ),
        obscureText: isPass,
        clipBehavior: Clip.none,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        showCursor: true,
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  bool onlyUpperCase;
  UpperCaseTextFormatter({this.onlyUpperCase = false});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: onlyUpperCase ? newValue.text.toUpperCase() : newValue.text,
        selection: newValue.selection);
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
  @override
  bool get skipTraversal => true;
  @override
  bool get canRequestFocus => true;
}
