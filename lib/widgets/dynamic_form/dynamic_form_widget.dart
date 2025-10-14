import 'package:dashboard/bloc/bpwidgetprops/model/bpwidget_props.dart';
import 'package:dashboard/widgets/alpha_text_field.dart';
import 'package:dashboard/widgets/customcontrols/key_value_dropdown.dart';
import 'package:dashboard/widgets/customcontrols/key_value_reactive_dropdown.dart';
import 'package:dashboard/widgets/customcontrols/key_value_reactive_textbox.dart';
import 'package:dashboard/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

Widget buildField(
  BpwidgetProps field, 
  FormGroup formGroup,
  BuildContext context, 
  // void Function(dynamic)? onItemSelected,
) {
  switch (field.controlType) {
    case "Textfield":
      return AlphaTextField(
        controlName: field.controlName, 
        label: field.label, 
        mantatory: field.isRequired == "true" ? true : false
      );

    case "Dropdown":
      return Dropdown(
        controlName: field.controlName, 
        label: field.label, 
        items: ["yes", "no"]
      );

    default:
      return const SizedBox();

  }

  
}