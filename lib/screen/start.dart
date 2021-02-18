import 'package:communication/Login/userLogin.dart';
import 'package:communication/main.dart';
import 'package:communication/privateAuthority/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          Text(
            "What are you looking for?",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => PrivateDashboard()));
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: col,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(20)),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                    child: Text("Private Authority",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, color: Colors.white))),
              ),
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (context) => Example()));
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: col,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(20)),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                    child: Text("Public Authority",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, color: Colors.white))),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
