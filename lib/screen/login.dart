import 'package:communication/screen/register.dart';
import 'package:communication/screen/start.dart';
import 'package:communication/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Lottie.asset('assets/login.json',
                    height: MediaQuery.of(context).size.height / 2.3),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: width * 0.93,
                    margin: new EdgeInsets.all(10.0),
                    child: new TextFormField(
                      autofocus: false,
                      decoration: new InputDecoration(
                        labelText: "Enter Mobile Number",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(
                            25.0,
                          ),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0 || val.length < 10) {
                          return "Enter a Valid Mobile Number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: width * 0.93,
                    margin: new EdgeInsets.all(10.0),
                    child: new TextFormField(
                      obscureText: true,
                      autofocus: false,
                      decoration: new InputDecoration(
                        labelText: "Enter Password",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(
                            30.0,
                          ),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0 || val.length < 10) {
                          return "Enter a Valid Mobile Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) => Start()));
                    },
                    child: Container(
                      height: 80.0,
                      width: width / 5,
                      decoration: BoxDecoration(
                          color: mainColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                blurRadius: 7.0,
                                spreadRadius: 2.0,
                                offset: Offset(4, 5)),
                          ],
                          borderRadius: BorderRadius.circular(300)),
                      child: Center(
                        child: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Not having account? ",
                          style: TextStyle(fontSize: 17, color: fontColor),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              "Register here",
                              style: TextStyle(fontSize: 17, color: fontColor),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
