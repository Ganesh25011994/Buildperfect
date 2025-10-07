import 'package:dashboard/bloc/bpwidgetprops/bpwidget_props_bloc.dart';
import 'package:dashboard/bloc/bpwidgetprops/model/bpwidget_props.dart';
import 'package:dashboard/widgets/customcontrols/key_value_dropdown.dart';
import 'package:dashboard/widgets/customcontrols/key_value_textbox.dart';
import 'package:dashboard/widgets/rightpanels/panel_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropsPanel extends StatefulWidget {
  final double width;
  final double height;
  const PropsPanel({super.key, required this.width, required this.height});

  @override
  State<PropsPanel> createState() => _PropsPanelState();
}

class _PropsPanelState extends State<PropsPanel> {
  TextEditingController labelController = TextEditingController();
  TextEditingController formNameController = TextEditingController();
  TextEditingController formTypeController = TextEditingController();
  TextEditingController minLengthController = TextEditingController();
  TextEditingController maxLengthController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BpwidgetPropsBloc, BpwidgetPropsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Card(
          color: Colors.white,
          child: SizedBox(
            width: widget.width,
            height: widget.height,

            child: Column(
              children: [
                PanelHeader(
                  panelWidth: widget.width,
                  title: 'Configure Formcontrol Properties',
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    textController: labelController,
                    labeltext: 'Label Text',
                    width: widget.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    textController: formNameController,
                    labeltext: 'Control Name',
                    width: widget.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    textController: formTypeController,
                    width: widget.width,
                    labeltext: 'Control Type',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueDropdown(
                    width: widget.width,
                    labeltext: 'Required ?',
                    dropdownEntries: <DropdownMenuEntry>[
                      DropdownMenuEntry(value: 'true', label: 'true'),
                      DropdownMenuEntry(value: 'false', label: 'false'),
                    ],
                    onSelected: (value) {
                      print('required ? => $value');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueDropdown(
                    width: widget.width,
                    labeltext: 'Verification Required ?',
                    dropdownEntries: <DropdownMenuEntry>[
                      DropdownMenuEntry(value: 'true', label: 'true'),
                      DropdownMenuEntry(value: 'false', label: 'false'),
                    ],
                    onSelected: (value) {
                      print('Verification Required ? => $value');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    textController: minLengthController,
                    width: widget.width,
                    labeltext: 'Minlength',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueTextbox(
                    textController: maxLengthController,
                    width: widget.width,
                    labeltext: 'Maxlength',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: KeyValueDropdown(
                    dropdownEntries: <DropdownMenuEntry>[
                      DropdownMenuEntry(value: 'email', label: 'Email'),
                      DropdownMenuEntry(value: 'phone', label: 'Phone'),
                      DropdownMenuEntry(value: 'pan', label: 'PAN'),
                      DropdownMenuEntry(value: 'aadhaar', label: 'Aadhaar'),

                      DropdownMenuEntry(value: 'dl', label: 'DL'),
                      DropdownMenuEntry(value: 'voterid', label: 'Voter ID'),
                      DropdownMenuEntry(value: 'passport', label: 'Passport'),

                      DropdownMenuEntry(value: 'gst', label: 'GST'),
                      DropdownMenuEntry(value: 'upi', label: 'UPI ID'),
                    ],
                    width: widget.width,
                    labeltext: 'Validations',
                    onSelected: (value) {
                      
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<BpwidgetPropsBloc>().add(BPWidgetPropsSave(
                        bpwidgetProps: BpwidgetProps(
                          label: labelController.text, 
                          controlName: formNameController.text, 
                          controlType: formTypeController.text,
                          max: int.parse(maxLengthController.text),
                          min: int.parse(minLengthController.text),
                        )
                      ));
                    }, 
                    child: Text('Save')
                  )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
