import 'package:emoface/layout/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}
class _registerState extends State<register> {
  late TextEditingController Firstname, Lastname, Age, Gender, Email_id,
      Password;
  int _value = 1;

  bool validateEmail(String value) {
    var email = value;
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    print(emailValid);
    return emailValid;
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1850, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        Age.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
  }

  var _passwordVisible;

  @override
  void initState() {
    Firstname = TextEditingController();
    Lastname = TextEditingController();
    Age = TextEditingController();
    // Gender = TextEditingController();
    Email_id = TextEditingController();
    Password = TextEditingController();
    super.initState();
  }

  void postdata() async {
    String url = login.url + "register/postdata/";
    var gender;
    if (_value == 1) {
      gender = "male";
    }
    else if (_value == 2) {
      gender = "female";
    }
    else if (_value == 2) {
      gender = "others";
    }
    if (Firstname.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Required First name")));
    }
    else if (Lastname.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Required Last name")));
    }
    else if (Age.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Required Age")));
    }
    else if (!validateEmail(Email_id.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Required Email ")));
    }
    else if (Password.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Required Password")));
    }
    else {
      var resp = await post(url, body: {
        "firstname": Firstname.text.toString(),
        "lastname": Lastname.text.toString(),
        "age": Age.text.toString(),
        "gender": gender,
        "email_id": Email_id.text.toString(),
        "password": Password.text.toString(),
      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => register()));
    }
  }

  // void initState() {
  //   _passwordVisible=false;
  // }
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
                padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                child: TextFormField(
                  controller: Firstname,
                  decoration: InputDecoration(
                      labelText: 'Firstname',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.abc)),

                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                child: TextFormField(
                  controller: Lastname,
                  decoration: InputDecoration(labelText: 'Lastname',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.abc)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                child: TextFormField(
                  controller: Age,
                  showCursor: true,
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: 'DOB',
                      hintText: 'Enter your date of birth ',
                      prefixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  onTap: () {
                    setState(() {
                      _selectDate(context);
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(70, 0, 30, 10), //3rd

                // width: 350.0,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     border: Border.all(color: Colors.black)
                // ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Gender"),
                        Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = 1;
                              });
                            }),
                        Text("Male"),
                        Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 2;
                            });
                          },
                        ),
                        Text("Female"),
                        Radio(
                          value: 3,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = 3;
                            });
                          },
                        ),
                        Text("Others"),
                      ],
                    )
                  ],
                ), //1st
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                child: TextFormField(
                  controller: Email_id,
                  decoration: InputDecoration(labelText: 'Email_id',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: Icon(Icons.mail)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                child: TextFormField(
                  controller: Password,
                  decoration: InputDecoration(labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // suffixIcon: IconButton(icon: Icon(
                    //   _passwordVisible
                    //   ?Icons.visibility
                    //       :Icons.visibility_off,
                    //   color: Theme.of(context).primaryColorDark,
                    // ),
                    //   onPressed: (){
                    //   setState(() {
                    //     _passwordVisible=!_passwordVisible;
                    //   });
                    //   },
                    // ) ,
                  ),
                ),
              ),

              Container(
                child: ElevatedButton(
                  onPressed: () {
                    postdata();
                  }, child: Text("Register"),
                ),
              ),
            ],),
          ),
      ),

    );
  }
}

