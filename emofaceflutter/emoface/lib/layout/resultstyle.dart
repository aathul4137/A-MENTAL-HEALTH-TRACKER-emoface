import 'package:emoface/layout/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/src/painting/border_radius.dart';
import 'package:flutter/src/widgets/container.dart';


class resultstyle extends StatefulWidget {
  const resultstyle({Key? key}) : super(key: key);

  @override
  State<resultstyle> createState() => _resultState();
  static var res;
}

class _resultState extends State<resultstyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Kindacode.com')),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
              child: TextFormField(
                focusNode: FocusNode(),
                enableInteractiveSelection: false,
                decoration: InputDecoration(labelText:resultstyle.res),
                // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                // suffixI0n: Icon(Icons.light_mode_outlined)),
              ),
            ),
          ),
        ));
  }
}