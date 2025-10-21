import 'package:flutter/material.dart';
import 'package:dashboard/bloc/bpwidgets/model/bpwidget.dart';
import 'package:dashboard/widgets/preview_screen/pages/personal_page.dart';
import 'package:device_preview/device_preview.dart';

class MobileScreen extends StatefulWidget {
  final List<BPWidget> pageData;
  const MobileScreen({super.key, required this.pageData});

  @override
  State<MobileScreen> createState() => MobileScreenState();
}

class MobileScreenState extends State<MobileScreen> {

  List<BPWidget> pageRenderData = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      pageRenderData = widget.pageData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (context) => PersonalPage(personalWidgetList: pageRenderData)
    );
  }
  
}