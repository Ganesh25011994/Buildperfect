import 'package:dashboard/bloc/bpwidgets/model/bpwidget.dart';
import 'package:dashboard/widgets/preview_screen/dynamic_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PersonalPage extends StatelessWidget {
  final List<BPWidget> personalWidgetList;
  const PersonalPage({super.key, required this.personalWidgetList});

  FormGroup? createFormGroup(widgetList) {
    try {
      final FormGroup dynmaicFormGroup = FormGroup({
        for (var field in widgetList)
          field.bpwidgetProps!.controlName: FormControl<String>(validators: [Validators.required]),
      });
      return dynmaicFormGroup;
    } catch (error) {
      print("createFormGroup-error $error");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final personalForm = createFormGroup(personalWidgetList);
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ReactiveForm(
            formGroup: personalForm!, 
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Personal Page",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                for (var field in personalWidgetList)
                  DynamicFormWidget(
                    field: field, 
                    formGroup: personalForm),

              ],
            )
          ),
        )
      ),
    );
  }
}