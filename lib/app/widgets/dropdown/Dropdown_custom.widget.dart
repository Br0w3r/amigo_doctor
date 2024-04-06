import 'package:flutter/material.dart';
import 'package:amigo_doctor/app/utils/decoration.utils.dart';

// ignore: must_be_immutable
class CustomDropDown<T> extends StatelessWidget {
  CustomDropDown({
    super.key,
    required this.labelText,
    required this.onchange,
    required this.selectedId,
    required this.listDynamic,
    required this.valueSelected,
    this.enable = true,
  }) {
    if (listDynamic.isNotEmpty) {
      //selectedId = listDynamic.first.value as T;
      removeDuplicates(listDynamic);
    } else {
      selectedId = 0 as T;
      listDynamic.add(
          const DropdownMenuItem(value: null, child: Text("Sin Registros")));
    }
  }

  final Function(T?) onchange;
  final String labelText;
  late T selectedId;
  final List<DropdownMenuItem<T>> listDynamic;
  final bool enable;
  final T valueSelected;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: enable,
      replacement: DropdownButtonFormField<T>(
        padding: const EdgeInsets.all(10),
        dropdownColor: Colors.white,
        enableFeedback: false,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        style: Theme.of(context).textTheme.bodyMedium,
        value: selectedId,
        items: listDynamic,
        onChanged: null,
        decoration: DecorationUtils.outLine(context, labelText: labelText),
        onTap: null,
      ),
      child: DropdownButtonFormField<T>(
        padding: const EdgeInsets.all(10),
        dropdownColor: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        style: Theme.of(context).textTheme.bodyMedium,
        value: selectedId,
        items: listDynamic,
        onChanged: (value) => onchange(value),
        decoration: DecorationUtils.outLine(context, labelText: labelText),
        onTap: enable ? () {} : null,
      )
    );
  }

  static List removeDuplicates(List list) {
    List newList = [];
    for (var element in list) {
      if (!newList.contains(element)) {
        newList.add(element);
      }
    }
    return newList;
  }
}
