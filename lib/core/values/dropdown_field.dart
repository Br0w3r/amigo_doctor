

import 'dropdown_item.dart';

class DropdownFieldConfig<T extends DropdownItem> {
  final String controlName;
  final String hint;
  final List<T> items;

  DropdownFieldConfig({
    required this.controlName,
    required this.hint,
    required this.items,
  });
}
