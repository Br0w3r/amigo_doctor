import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveToggle extends StatelessWidget {
  final String controlName;
  final String labelText;

  const CustomReactiveToggle({super.key, required this.controlName, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(labelText, style: const TextStyle(fontSize: 16.0, color: Colors.black54)),
          ReactiveSwitch.adaptive(
            formControlName: controlName,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
