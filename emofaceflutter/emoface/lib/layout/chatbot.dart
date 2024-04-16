import 'package:emoface/layout/login.dart';
import 'package:emoface/layout/question.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart';

class chatbot extends StatefulWidget {
  const chatbot({super.key});

  @override
  State<chatbot> createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {
  late TextEditingController quest;
  @override
  void initState() {
    quest = TextEditingController();
    List_function();

    super.initState();
  }

  void postdata() async {
    String url = login.url + "chatbot/chatbot/";
    var resp = await post(url,
        body: {"quest": quest.text.toString(), "uid": login.uid.toString()});
  }

  late List data;
  void List_function() async {
    var url = Uri.parse(login.url + "chatbot/vicb/");
    Response resp1 = await get(url);

    this.setState(() {
      data = jsonDecode(resp1.body);
    });
    print(resp1.body);
  }

  @override
  Widget build(BuildContext context) {
    List_function();
    // return Container();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 25, 15, 138),
          title: Text("chatbot"),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                  child: TextFormField(
                    controller: quest,
                    decoration: InputDecoration(
                        labelText: 'May I help you',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: Icon(Icons.abc)),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      postdata();

                      // Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (BuildContext context) => chatbot()));
                    },
                    child: Text("Ask"),
                  ),
                ),
                Expanded(
    child: new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, index) {
        return new Padding(
          padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
          child: new Card(
            elevation: 2.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(16.0)
            ),
            child: InkWell(
              onTap: () {

                print("tapped");
                //  tap funtion here
              },
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text('QUESTION : '+data[index]['quest'].toUpperCase(), style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium,
                        // ), new Text('DETAILS : '+data[index]['details'].toUpperCase(), style: Theme
                        //     .of(context)
                        //     .textTheme
                        //     .titleMedium,
                        ), new Text('ANSWER : '+(data[index]['resp']).toString().toUpperCase(), style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium,
                        ),
                        // new SizedBox(height: 6.0),
                        // new Text('DATE : '+data[index]['date'], style: Theme
                        //     .of(context)
                        //     .textTheme
                        //     .titleMedium,
                        // ),




                        new SizedBox(height: 6.0),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    )
),
              ],
            ),
          ),
        ));
  }
}
