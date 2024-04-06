import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/utils/decoration.utils.dart';
import 'package:amigo_doctor/app/widgets/appBar/custom_dynamic_appbar.widget.dart';
import 'package:amigo_doctor/app/widgets/form/fields_form/custom_reactive_dropdown.widget.dart';
import 'package:amigo_doctor/app/widgets/form/fields_form/custom_reactive_text.widget.dart';
import 'package:amigo_doctor/app/widgets/form/fields_form/custom_reactive_toggle.widget.dart';
import 'package:amigo_doctor/core/values/dropdown_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DynamicReactiveDialog<T> extends StatelessWidget {
  final String title;
  final FormGroup formGroup;
  final Future<void> Function(Map<String, dynamic> model) onSave;
  final List<DropdownFieldConfig> dropdownFields;

  const DynamicReactiveDialog({
    super.key,
    required this.title,
    required this.formGroup,
    required this.onSave,
    this.dropdownFields = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomDynamicAppBar(
              title: title.obs,
              sizeTitleAppBar: -3,
              isDialog: true,
              showLeading: false,
              icon: Icons.close,
              onIcondPressed: () {
                Navigator.of(context).pop();
              },
            ).paddingOnly(bottom: 10.0),
            Expanded(
              child: SingleChildScrollView(
                child: ReactiveForm(
                  formGroup: formGroup,
                  child: Column(
                    children: [
                      ..._buildFormFields(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<dynamic> _buildFormFields() {
    final isReadOnly = formGroup.control('folio').value != null;
    return formGroup.controls.keys.map((controlName) {
      final DropdownFieldConfig? dropdownConfig = dropdownFields
          .firstWhereOrNull((config) => config.controlName == controlName);
      if (formGroup.control(controlName).value is bool) {
        return CustomReactiveToggle(
          controlName: controlName,
          labelText: translateFieldName(controlName),
        );
      } else if (dropdownConfig != null) {
        return CustomReactiveDropdown(
          controlName: dropdownConfig.controlName,
          hint: dropdownConfig.hint,
          items: dropdownConfig.items,
        );
      } else {
        String translatedLabel = translateFieldName(controlName);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
          child: CustomReactiveTextField(
            controlName,
            labelText: translatedLabel,
            keyboard: TextInputType.text,
            readOnly: isReadOnly,
            decoration: DecorationUtils.outLine(
              Get.context!,
              labelText: translatedLabel,
            ),
            maxLength: isReadOnly ? null : 40,
          ),
        );
      }
    }).toList();
  }

  String translateFieldName(String fieldName) {
    Map<String, String> translations = {
      'num_dispositivos_solicitados': 'Número de dispositivos solicitados',
      'codigo_origen': 'Origen',
      'codigo_destino': 'Destino',
      'solicitante_nombre': 'Nombre del solicitante',
      'responsable_nombre': 'Nombre del responsable',
      'fecha_solicitud': 'Fecha de solicitud',
      'fecha_respuesta': 'Fecha de respuesta',
    };

    return translations[fieldName] ??
        fieldName[0].toUpperCase() + fieldName.substring(1);
  }
}
