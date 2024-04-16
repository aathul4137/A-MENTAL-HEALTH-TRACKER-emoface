import 'package:emoface/layout/expression.dart';
import 'package:emoface/layout/login.dart';
import 'package:emoface/layout/photocapture.dart';
import 'package:emoface/layout/question.dart';
import 'package:emoface/layout/register.dart';
import 'package:emoface/layout/resultstyle.dart';
import 'package:emoface/layout/test.dart';
import 'package:emoface/layout/web.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    routes: {
      '/':(context)=>login(),
      '/chatbot':(context)=>cbott(),
      '/ques':(context)=>question(),
      '/expr' :(context)=>expression(),
      '/neew':(context)=>Home(),

    },
  ));
}