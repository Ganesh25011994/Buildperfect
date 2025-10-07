/*
@author     :   karthick.d  30/09/2025
@desc       :   rightpanel contains the components for configuring UDF (user defined fields)
                right panel have segment button for configuration segments
                conf segment 1 - properties 
                     {properties} segment wraps formcontrol properties
                     {action}     segment wraps formcontrols events
                     {datasource} segment wraps datasource for dropdown fields
                the above three components encaps in widgets 
                [FormControlProperties] - wraps all controls for props conf
                [FormControlActions]    - wraps all controls for events conf
                [FormControlDataSource] - wraps all controls for control's DS
*/
import 'package:dashboard/bloc/bpwidgetprops/bpwidget_props_bloc.dart';
import 'package:dashboard/types/ui_controls_types.dart';
import 'package:dashboard/widgets/page_props_button_segment.dart';
import 'package:dashboard/widgets/rightpanels/actions_panel.dart';
import 'package:dashboard/widgets/rightpanels/datasource.dart';
import 'package:dashboard/widgets/rightpanels/props_panel.dart';
import 'package:dashboard/widgets/save_edit_view_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RightPanel extends StatefulWidget {
  /// onSegmentButtonClicked method send the current tab
  /// based on that loan propspanel , actionpanel and datapanel widget
  final double width;
  final double height;
  const RightPanel({super.key, required this.width, required this.height});

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  late double panelWidth = widget.width;
  double gutterHeight = 82;
  late double panelHeight = widget.height - gutterHeight;
  Set<PagePropsSegmentButton> selectedSegmentButton = {
    PagePropsSegmentButton.property,
  };

  void _segementButtonChangedListener(
    Set<PagePropsSegmentButton> selectedSegment,
  ) {
    print(selectedSegment.single);
    selectedSegmentButton = selectedSegment;
    setState(() {});
  }

  Widget renderPanelsBasedOnSegment() {
    return switch (selectedSegmentButton.first) {
      PagePropsSegmentButton.property => PropsPanel(
        width: panelWidth,
        height: panelHeight,
      ),
      PagePropsSegmentButton.action => ActionsPanel(
        width: panelWidth,
        height: panelHeight,
      ),
      PagePropsSegmentButton.datasource => DatasourcePanel(
        width: panelWidth,
        height: panelHeight,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BpwidgetPropsBloc(), lazy: false),
      ],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SaveEditViewButtonWidget(
                  jsonHeaderName: "BPWidget",
                ),
              ]
            ),
            SizedBox(height: 5),
            PagePropsButtonSegment(
              onSegmentChanged: _segementButtonChangedListener,
            ),
            renderPanelsBasedOnSegment(),
          ],
        ),
      ),
    );
  }
}

final reffinalJsonData = {
  "BuildPerfectDataObject": {
    "clientId": "string",
    "applicationName": "string",
    "applicationId": "string",
    "bpWidgets": [
      {
        "pageName": "string",
        "pageId": "string",
        "onInit": "callback",
        "pageComponentsList": [
          {
            "bpformGroup": {
              "formFieldBox": [
                {
                  "properties": {
                    "label": "string",
                    "formControlsName": "string",
                    "formType": "formTypeName",
                    "required": true,
                    "Pattern": "string (optional)",
                    "maxlangth": 10,
                    "minlength": 1,
                    "valiation": true
                  },
                  "actions": {
                    "onChange": "callback"
                  },
                  "dataList": {
                    "masterName": "string",
                    "headername": "string"
                  }
                }
              ]
            },
            "cardListComponent": {
              "cardProperties": {},
              "cardAction": {}
            },
            "dialogComponent": {
              "headerMsg": "string",
              "message": "string"
            },
            "buttonAction": [
              {
                "actionType": "apiCall",
                "naviagationAction": {
                  "dataMap": {},
                  "navigationPage": "string"
                },
                "apiCallaction": {
                  "apiMethodName": "string",
                  "requestObject": {},
                  "SuccessMessage": "string (optional)",
                  "errorMessage": "string (optional)"
                }
              }
            ]
          }
        ]
      }
    ]
  }
};