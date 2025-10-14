import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatefulWidget {

  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => MobileScreenState();
}

class MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (context) => Text("Mobile Screen Opened")
    );
  }
  
}