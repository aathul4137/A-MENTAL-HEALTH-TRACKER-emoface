
import 'package:emoface/layout/login.dart';
import 'package:emoface/layout/question.dart';
import 'package:emoface/layout/result.dart';
import 'package:emoface/layout/resultstyle.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';


class question extends StatefulWidget {
  const question({super.key});
  static var index=0;
  static var rs;
  static var qno;
  static var result="";
  @override
  State<question> createState() => _questionState();
}

class _questionState extends State<question> {

  List dropList =[
    {"question_no":0, "option_1": "a"},
    {"question_no":1, "option_2": "b"},
    {"question_no":2, "option_3": "c"},
    {"question_no":3, "option_4": "<D>"},
  ];
  var fkey=GlobalKey<FormState>();
  var val=true;
  var dropdownValue = "";
  // void gendrop() async {
  //   String url = login.url+"questions/ques/";
  //   var resp = await get(url);
  //   print(resp.body);
  //   setState(() {
  //     dropList = jsonDecode(resp.body);
  //   });
  // }

  late List data;

  void postdata(rs,qno)async{
    print("helloo");
    String url=login.url+"result/res/";
    var resp=await post(url,body:{
      "result":rs,
      "q_no":qno.toString()
    });

    if(qno==19)
      {
        setState(() {
            question.result=resp.body;
            resultstyle.res=question.result;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => resultstyle()));

        });
      }
  }

  void List_function() async {
  var url = Uri.parse(login.url+"questions/ques/");
  Response resp1 = await get(url);

  this.setState(() {
    data = jsonDecode(resp1.body);
    dropList=[
    {"question_no":0, "option_1": data[question.index]['option_1'].toString()},
    {"question_no":1, "option_1": data[question.index]['option_2'].toString()},
    {"question_no":2, "option_1": data[question.index]['option_3'].toString()},
    {"question_no":3, "option_1": data[question.index]['option_4'].toString()},
    ];
  });
  print(resp1.body);
}


  // void getdata() async {
  //   var url= login.url+"questions/ques/";
  //   // String url = "http://192.168.0.82:8000/questions/ques/";
  //   Response resp = await get(url);
  //   data=jsonDecode(resp.body);
  //   this.setState(() {
      
  //   });
  //   print(resp.body);
  // }

  @override
  Widget build(BuildContext context) {
    List_function();
    // gendrop();
    // return Container();
return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 25, 15, 138),
        title: Text("Questionnaire"),
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
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: TextFormField(
                focusNode: FocusNode(),
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                    labelText: data[question.index]['question'].toString(),
                ),
              ),
            ),

             Container(
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: TextFormField(
                focusNode: FocusNode(),
                enableInteractiveSelection: false,
                decoration: InputDecoration(labelText: data[question.index]['option_1'].toString(),
                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    suffixIcon: Icon(Icons.sentiment_very_satisfied)),
                onTap: (){
                  postdata("1",question.index);
                  setState(() {
                    if (question.index<19) {
                      question.index += 1;


                    }
                    else
                      {

                      }


                  });
                },
              ),
            ),
             Container(
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: TextFormField(
                focusNode: FocusNode(),
                enableInteractiveSelection: false,
                decoration: InputDecoration(labelText: data[question.index]['option_2'].toString(),
                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    suffixIcon: Icon(Icons.mood_bad)),
                  onTap: (){
                  postdata("2",question.index);
                  setState(() {
                    if (question.index<19) {
                      question.index += 1;


                    }
                    else
                    {

                    }
                  });
                },
              ),
            ),
             Container(
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: TextFormField(
                focusNode: FocusNode(),
                enableInteractiveSelection: false,
                decoration: InputDecoration(labelText: data[question.index]['option_3'].toString(),
                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    suffixIcon: Icon(Icons.sentiment_neutral_outlined)),
                onTap: (){
                  postdata("3",question.index);
                  setState(() {
                    if (question.index<19) {
                      question.index += 1;


                    }
                    else
                    {

                    }
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
              child: TextFormField(
                focusNode: FocusNode(),
                enableInteractiveSelection: false,
                decoration: InputDecoration(labelText: data[question.index]['option_4'].toString(),
                    border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    suffixIcon: Icon(Icons.sentiment_dissatisfied_sharp)),
                onTap: (){
                  postdata("4",question.index);
                  setState(() {
                    if (question.index<19) {
                      question.index += 1;
                    }
                    else
                    {

                    }
                  });
                },
              ),
    ),
            // Container(
            //   padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
            //   child: TextFormField(
            //     focusNode: FocusNode(),
            //     enableInteractiveSelection: false,
            //     decoration: InputDecoration(labelText:question.result,
            //         border:  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            //         suffixIcon: Icon(Icons.sentiment_dissatisfied_sharp)),
            //
            //   ),
            // ),
                        // Container( //dropdown
            //     padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd
            //
            //
            //
            //     width: 350.0,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         border: Border.all(color: Colors.black)
            //     ),
            //
            //     child: DropdownButtonFormField(
            //         hint: Text("<select the service type>"),
            //         onChanged: ( newValue) {
            //           setState(() {
            //             dropdownValue = newValue.toString();
            //             print(dropdownValue);
            //           });
            //         },
            //         items: dropList.map((item) => DropdownMenuItem(child: Text(item['option_1'].toString()),value:item['question_no'].toString(),)).toList()
            //     )
            //
            // ),
             Container(
  child: ElevatedButton(
    onPressed: (){
      setState(() {
        question.index+=1;
      });
      // Navigator.of(context).push(MaterialPageRoute(
      //           builder: (BuildContext context) => question()));

    },child: Text("Next"),
  ),
   ),
   ],),
  ),
      ),
    );
  }
}









        