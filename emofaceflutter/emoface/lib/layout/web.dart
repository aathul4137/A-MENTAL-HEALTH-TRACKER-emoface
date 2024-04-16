// import 'package:evstation/layouts/login.dart';
// import 'package:career_prediction/layout/login.dart';
import 'package:emoface/layout/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class cbott extends StatefulWidget {
  // static var url;
  const cbott({Key? key}) : super(key: key);
  @override
  State<cbott> createState() => _cbottState();
}

class _cbottState extends State<cbott> {
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(url: login.url+"message/msg/",
      appBar: new AppBar(
        title: new Text("CBOT"),
      ),);
  }
}
