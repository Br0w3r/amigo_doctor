import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/widgets/form/fields_form/custom_reactive_dropdown.widget.dart';
import 'package:amigo_doctor/app/widgets/form/fields_form/custom_reactive_text.widget.dart';
import 'package:amigo_doctor/app/widgets/form/fields_form/custom_reactive_toggle.widget.dart';
import 'package:amigo_doctor/core/values/dropdown_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DynamicReactiveFields<T> extends StatelessWidget {
  final FormGroup formGroup;
  final Future<void> Function(Map<String, dynamic> model)? onSave; 
  final List<DropdownFieldConfig> dropdownFields;
  final int? order;

  const DynamicReactiveFields({
    super.key, 
    required this.formGroup,
    this.onSave, 
    this.dropdownFields = const [],
    this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ReactiveForm(
          formGroup: formGroup,
          child: Column(
            children: [
              ..._buildFormFields(),
              const SizedBox(height: 10.0),
            ],
          ), 
        ),
      ],
    );
  }

  List<Widget> _buildFormFields() {
  if (order == 1) {
    var controlNames = formGroup.controls.keys.toList();

    return <Widget>[
      Row(
        children: [
          Expanded(
            flex: 9, 
            child: _buildFieldWidget(controlNames[0]),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            flex: 3, 
            child: _buildFieldWidget(controlNames[1]),
          ),
          Expanded(
            flex: 3,
            child: _buildFieldWidget(controlNames[2]),
          ),
          Expanded(
            flex: 3, 
            child: _buildFieldWidget(controlNames[3]),
          ),
        ],
      ),
    ];
  }
   else {
    List<Widget> fields = [];
    for (var controlName in formGroup.controls.keys) {
      fields.add(_buildFieldWidget(controlName));
    }
    return fields;
  }
}


  Widget _buildFieldWidget(String controlName) {
    final control = formGroup.control(controlName);
    final isReadOnly = control.value != null && control.value.toString().isNotEmpty;
    final DropdownFieldConfig? dropdownConfig = dropdownFields.firstWhereOrNull((config) => config.controlName == controlName);

    if (formGroup.control(controlName).value is bool) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: CustomReactiveToggle(
            controlName: controlName,
            labelText: translateFieldName(controlName),
          ),
        );
    } else if (dropdownConfig != null) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: CustomReactiveDropdown(
            controlName: dropdownConfig.controlName,
            hint: dropdownConfig.hint,
            items: dropdownConfig.items,
          ),
        );
    } else {
        String translatedLabel = translateFieldName(controlName);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
          child: CustomReactiveTextField(
            controlName,
            labelText: translatedLabel,
            keyboard: TextInputType.text,
            readOnly: isReadOnly,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.0),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
              labelText: translatedLabel,
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
            maxLength: isReadOnly ? null : 40,
          ),
        );
    }
}


  String translateFieldName(String fieldName) {
    Map<String, String> translations = {
      'cantidad': '# MiFis',
    };

    return translations[fieldName] ??
        fieldName[0].toUpperCase() + fieldName.substring(1);
  }
}
