
import 'package:flutter/material.dart';
import 'package:emoface/layout/login.dart';

import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';

class expression extends StatefulWidget {
  const expression({Key? key}) : super(key: key);

  @override
  State<expression> createState() => _expressionState();
}

class _expressionState extends State<expression> {
   late TextEditingController photo;
   var fil, objfile;

      void postdata() async {
        var url = login.url + "expression/expr/";
        // String url = "http://192.168.137.173:8000/expression/expr/";
        // Response resp = await post(url, body: {
        // });
        // file_up() async {
        //   print('added successfully');
          var result = await FilePicker.platform.pickFiles(
              withReadStream: true);
          if (result != null) {
            // var fil=result.files.single.path;
            setState(() {
              fil = result.files.first.name;
              objfile = result.files.single;
              // photo.text = fil;


            });
            final request =  MultipartRequest("POST",Uri.parse(login.url + "expression/expr/"));
            request.fields["id"] = "local";
            request.files.add(MultipartFile("file", objfile.readStream, objfile.size,filename: objfile.name));
            var resp1 = await request.send();
            final respStr = await resp1.stream.bytesToString();
            print(respStr);

          } else {
            // User canceled the picker
          }
        // }
      }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 25, 15, 138),
        title: Text("emotion"),

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
              padding: EdgeInsets.symmetric(vertical: 1.0),
              width: double.infinity,
              child: ElevatedButton(
                // elevation: 5.0,
                onPressed: () {
                  postdata();
                },
                // padding: EdgeInsets.all(15.15),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) , topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                //   //borderRadius: BorderRadius.only()
                // ),
                // color: Colors.white,
                child: Text(
                  'Upload pic ',
                  style: TextStyle(
                    color: Color(0xFF072850),
                    letterSpacing: 1.5,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),

            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                  // Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (BuildContext context) => question()));

                }, child: Text("Next"),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}


//
// import 'package:emoface/layout/login.dart';
//
// import 'dart:convert';
// import 'package:file_picker/file_picker.dart';
// import 'package:http/http.dart';
//  class expression extends StatefulWidget {
//    const expression({Key? key}) : super(key: key);
//
//    @override
//    State<expression> createState() => _expressionState();
// }
//
//  class _expressionState extends State<expression> {
//    late TextEditingController photo;
//
//    var fil, objfile;
//
//
//      @override
//      Widget build(BuildContext context) {
//        return Scaffold(
//          appBar: AppBar(backgroundColor: Color.fromARGB(255, 25, 15, 138),
//            title: Text("emotion"),
//
//          ),
//          body: Container(
//            decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage('assets/bg.jpg'),
//                  fit: BoxFit.cover,
//                )
//            ),
//            child: SingleChildScrollView(
//              child: Column(children: [
//                Container(
//                  padding: EdgeInsets.symmetric(vertical: 1.0),
//                  width: double.infinity,
//                  child: ElevatedButton(
//                    // elevation: 5.0,
//                    onPressed: () {
//                      file_up();
//                    },
//                    // padding: EdgeInsets.all(15.15),
//                    // shape: RoundedRectangleBorder(
//                    //   borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) , topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
//                    //   //borderRadius: BorderRadius.only()
//                    // ),
//                    // color: Colors.white,
//                    child: Text(
//                      'pick one photo as your profile pic ',
//                      style: TextStyle(
//                        color: Color(0xFF072850),
//                        letterSpacing: 1.5,
//                        fontSize: 14.0,
//                        fontWeight: FontWeight.bold,
//                        fontFamily: 'OpenSans',
//                      ),
//                    ),
//                  ),
//                ),
//
//                Container(
//                  child: ElevatedButton(
//                    onPressed: () {
//                      setState(() {});
//                      // Navigator.of(context).push(MaterialPageRoute(
//                      //           builder: (BuildContext context) => question()));
//
//                    }, child: Text("Next"),
//                  ),
//                ),
//              ],),
//            ),
//          ),
//        );
//      }
//    }
//
//    Widget build(BuildContext context) {
//      //TODO: implement build
//      throw UnimplementedError();
//    }
//
//    @override
//    Widget build(BuildContext context) {
//      //TODO: implement build
//      throw UnimplementedError();
//    }
//  }
