import 'package:emoface/layout/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class result extends StatefulWidget {
  const result({Key? key}) : super(key: key);

  @override
  State<result> createState() => _resultState();
  static var res;
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 61, 1, 63),
        title: Text("EmoFace"),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
          padding: EdgeInsets.fromLTRB(80,30,80,30),
              child: TextFormField(
                focusNode: FocusNode(),
                enableInteractiveSelection: false,
                decoration: InputDecoration(labelText:result.res),
                   // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                   // suffixI0n: Icon(Icons.light_mode_outlined)),
        ),
            ),
      ],),
     ),
      ),
    );
  }
}
