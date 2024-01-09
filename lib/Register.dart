import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registerition/RecieveData.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  List<String> dropDown = ["Senior", "Fresh Graduate", "Jenior"];

  //default value of spinner
  String SelectState = "Senior";

  //check for male or female
  bool isMale = true;
  bool isFemale = true;
  bool termsAccepted = false;

  //to send name
  TextEditingController firstNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple.shade50, title: Text("Register Form")),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //الاسم الموجود تحت
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //pass الموجود تحت
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton(
                //value:SelectState to put default value
                value: SelectState,

                items: dropDown.map((String EducationLevel) {
                  return DropdownMenuItem<String>(
                    value: EducationLevel,
                    child: Text(EducationLevel),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      //SelectState default value of spineer
                      SelectState = newValue;
                    });
                  }
                },
              ),

              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Radio(
                      value: false,
                      groupValue: isMale,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            isMale = value;
                            isFemale = !value;
                          });
                        }
                      }),
                  Text("Male"),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: isFemale,
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(() {
                              isMale = !value;
                              isFemale = value;
                            });
                          }
                        },
                      ),
                      Text("Female"),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Checkbox(
                      value: termsAccepted,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            termsAccepted = value;
                          });
                        }
                      },
                    ),
                  ),
                  Text("Accept Terms"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                //to prevent user to go to other page until check box is checked
                  onPressed: termsAccepted
                      ? () {
                          // this code to send data user enterd in first name
                          String firstName = firstNameController.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecieveData(firstName: firstName),
                            ),
                          );
                       SnackBar( content: Text("Enter valid"),);
                        }
                      : null,
                  //   print("done");
                  // },
                  //only code for style of button
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade50,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      textStyle: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal)),
                  child: Text("Done")),
            ]),
      ),
    );
  }
}
