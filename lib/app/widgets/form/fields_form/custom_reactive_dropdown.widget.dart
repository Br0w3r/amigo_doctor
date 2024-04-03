import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/values/dropdown_item.dart';

class CustomReactiveDropdown<T extends DropdownItem> extends StatelessWidget {
  final String controlName;
  final String hint;
  final List<DropdownItem> items;

  const CustomReactiveDropdown({super.key, 
    required this.controlName,
    required this.hint,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField<int>(
      formControlName: controlName,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ), 
        contentPadding: const EdgeInsets.all(10.0),  
      ),
      items: items.map((item) {
        return DropdownMenuItem<int>(
          value: item.dropdownValue,
          child: Text(item.dropdownLabel),
        );
      }).toList(),
      hint: Text(hint),
    ).paddingOnly(left: 20.0, right: 20.0);
  }
}
