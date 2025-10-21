import 'package:dashboard/bloc/bpwidgets/model/bpwidget.dart';
import 'package:dashboard/widgets/alpha_text_field.dart';
import 'package:dashboard/widgets/drop_down.dart';
import 'package:dashboard/widgets/preview_screen/input_widgets/integer_text_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DynamicFormWidget extends StatelessWidget {
  final BPWidget field;
  final FormGroup formGroup;
  final void Function(dynamic)? onItemSelected;
  const DynamicFormWidget({super.key, required this.field, required this.formGroup, this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    switch (field.bpwidgetProps!.controlType) {
    case "Textfield":
      return AlphaTextField(
        controlName: field.bpwidgetProps!.controlName,
        label: field.bpwidgetProps!.label,
        mantatory: true,
      );

    case "IntegerTextField":
      return IntegerTextField(
        controlName: field.bpwidgetProps!.controlName,
        label: field.bpwidgetProps!.label,
        mantatory: true,
        maxlength: 10,
      );

    case "Dropdown":
      return Dropdown(
        controlName: field.bpwidgetProps!.controlName,
        label: field.bpwidgetProps!.label,
        items: ['yes','no']
      );

    case "Button":
      return ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Color.fromARGB(255, 2, 59, 105),
          ),
          foregroundColor:
              MaterialStatePropertyAll(Colors.white),
        ),
        onPressed: () {},
        child: Text(field.bpwidgetProps!.label),
      );
    

    default:
      return const SizedBox();
    }
  }
}