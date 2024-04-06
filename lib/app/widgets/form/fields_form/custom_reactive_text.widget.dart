import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../../../core/values/validation_messages.dart';
import '../../../utils/decoration.utils.dart';

class CustomReactiveTextField extends StatelessWidget {
  final String controlName;
  late final String labelText;
  final TextInputType? keyboard;
  final int? maxLength;
  final int? minLength;
  final int? maxLines;
  final bool isPass;
  final bool? isActive;
  final IconData? iconSuffix;
  final void Function(FormControl<dynamic>)? onSubmitted;
  final TextEditingController textEditing = TextEditingController(text: "");
  final InputDecoration? decoration;
  final String? isNotMatch;
  final double? customPadding;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

  CustomReactiveTextField(
    this.controlName, {
    super.key,
    this.labelText = "",
    this.isActive,
    this.maxLength,
    this.minLength,
    this.onSubmitted,
    this.iconSuffix,
    this.maxLines,
    this.isPass = false,
    this.decoration,
    this.isNotMatch,
    this.keyboard,
    this.customPadding = 8.0,
    this.inputFormatters,
    this.readOnly = false,
    Function(dynamic value)? onChanged,
  }) {
    if (labelText.isEmpty) labelText = controlName;
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
        scribbleEnabled: isActive ?? true,
        enableInteractiveSelection: isActive ?? true,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        focusNode: isActive != null ? AlwaysDisabledFocusNode() : null,
        maxLines: maxLines ?? 1,
        maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
        maxLength: maxLength,
        validationMessages:
            validationMessages(minLength, maxLength, equals: isNotMatch ?? ""),
        keyboardType: keyboard,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: decoration ??
            DecorationUtils.outLine(context,
                labelText: labelText,
                suffixIcon: iconSuffix,
                isReadlyOnly: isActive ?? true),
        obscureText: isPass,
        clipBehavior: Clip.none,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        showCursor: true,
      ),
    );
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
