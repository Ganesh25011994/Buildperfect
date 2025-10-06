import 'package:flutter/material.dart';
import 'package:flutter_json/flutter_json.dart';

class JsonViewer extends StatelessWidget {
  final String jsonHeader;
  final Map<String,dynamic> jsonObject;
  final List<String>? hiddenKeyList;
  const JsonViewer({super.key, required this.jsonHeader, required this.jsonObject, this.hiddenKeyList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(jsonHeader),
      ),
      body: JsonWidget(
        json: jsonObject,
        initialExpandDepth: 5,
        hiddenKeys: hiddenKeyList ?? [],
      ),
    );
  }
}