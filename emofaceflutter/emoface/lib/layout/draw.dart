import 'dart:math';


import 'package:emoface/layout/login.dart';
import 'package:flutter/material.dart';

class draw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/main.png'),
                      // backgroundImage: ,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 20, 30),
                      child: Text(
                        login.nm,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )

                ],
                alignment: AlignmentDirectional.center,
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple[400],
              ),
            ),


            ListTile(
              leading: Icon(Icons.apartment_sharp),
              title: Text('CHATBOT'),
              onTap: (){

                Navigator.pushNamed(context, '/chatbot');
              },
            ),
    ListTile(
    leading: Icon(Icons.book_outlined),
    title: Text('QUESTIONS'),
    onTap: (){

    Navigator.pushNamed(context,'/ques');
    },
    ),
    ListTile(
    leading: Icon(Icons.camera_front),
    title: Text('EMOTION DETECTION'),
    onTap: (){

    Navigator.pushNamed(context,'/expr');
    },
    ),
    ListTile(
    leading: Icon(Icons.camera_front),
    title: Text('EMOTION DETECTION new'),
    onTap: (){

    Navigator.pushNamed(context,'/neew');
    },
    ),

            ListTile(
              leading: Icon(Icons.message_outlined),
              title: Text('LOGOUT'),
              onTap: (){
                // Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}