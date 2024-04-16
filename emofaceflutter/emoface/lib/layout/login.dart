import 'dart:convert';
import 'dart:ui';

import 'package:emoface/layout/chatbot.dart';
import 'package:emoface/layout/chatbotnew.dart';
import 'package:emoface/layout/draw.dart';
import 'package:emoface/layout/question.dart';
import 'package:emoface/layout/register.dart';
import 'package:emoface/layout/web.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
  static var url="http://192.168.1.69:8000/";
  static var uid="1";
  static var nm="";
}

class _loginState extends State<login> {
  late TextEditingController username,password;
  var data=[];

  @override
  void initState() {
    username=TextEditingController();
    password=TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  void postdata() async {
    var url= login.url+"login/log/";
    // String url = "http://192.168.137.148:8000//login/log/";
    Response resp = await post(url, body: {
      "Username": username.text,
      "Password": password.text,
    });

    data=jsonDecode(resp.body);
    if (data.length>0)
    {
      login.uid=data[0]['u_id'].toString();
      login.nm=data[0]['username'].toString();
      if(data[0]['type']=="user")
      {
        // Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => draw()));
        showDialog(context: context, builder: (context) => AlertDialog(
            content: Text("you have successfully logged in")));

      }
    }





  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EmoFace",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text("LOGIN",style: new TextStyle(
                
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(200, 60, 0, 100)
                  ),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                  child: TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        labelText: "USERNAME",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 70,
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: (){
                      postdata();

                      // actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
                      // )
                      // );
                    },
                    child: Text("LOGIN"),
                  ),
                ),
                Container(
                  width: 300,
                  height: 70,
                  padding: EdgeInsets.fromLTRB(50,10,50,10),


                  child:
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));


                  },
                    child: Text('Sign Up',style: new TextStyle(fontSize: 20)),),


                  // child: ElevatedButton(onPressed:(){  },
                  //   child: Text('sign in',style: new TextStyle(fontSize: 20)),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}