import 'dart:convert';

import 'package:communication/widget/bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboard createState() => _UserDashboard();
}

TextEditingController start = new TextEditingController();
TextEditingController end = new TextEditingController();

Future<Map> getUri() async {
  String url =
      'http://apigo-docker.herokuapp.com/heroku_83210746493cc84/private/1';
  Response response = await get(url);
  return json.decode(response.body);
}

class _UserDashboard extends State<UserDashboard> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 30),
            child: Column(
              children: <Widget>[
                Image(image: AssetImage('assets/images/namaste.png')),
                SizedBox(height: 30),
                Text(
                  "Welcome....",
                  style: TextStyle(fontSize: 30, color: Colors.orange),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: start,
                decoration: InputDecoration(
                  labelText: "Enter Starting Point",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              )),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                controller: end,
                decoration: InputDecoration(
                  labelText: "Enter Destination Point",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              )),
          SizedBox(height: 20),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                selectedDate.toString(),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Icon(Icons.calendar_today),
              )
            ],
          )),
          SizedBox(height: 30),
          Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 17,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.orange),
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              getVehicals(start.text, end.text, context)),
                    );
                    Fluttertoast.showToast(
                        msg: "Please Wait", toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )))
        ],
      ),
    ));
  }
}

Widget getVehicals(start, end, context) {
  return Scaffold(
      body: Container(
          child: FutureBuilder(
              future: getUri(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  Map data = snapshot.data;
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        // if (data["vehicalstartpoint"] == start &&
                        //     data["vehicalendpoint"] == end) {
                        return GestureDetector(
                          onTap: () {
                            showBottom(
                                context,
                                data["vehicalCategory"].toString(),
                                data["vehicalstarttime"].toString(),
                                data["vehicalfare"].toString(),
                                start,
                                end);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 4.5,
                            decoration: BoxDecoration(color: Colors.pink),
                            child: Column(
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  data["vehicalCategory"].toString(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(height: 20),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Destination Point:  " +
                                            data["vehicalendpoint"].toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Starting Point:  " +
                                            data["vehicalstartpoint"]
                                                .toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Starting Time:  " +
                                            data["vehicalstarttime"].toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Fare:  Rs." +
                                            data["vehicalfare"].toString(),
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                        // }
                      });
                } else {
                  //spinner
                  return Center(child: Text("No Data"));
                }
              })));
}
