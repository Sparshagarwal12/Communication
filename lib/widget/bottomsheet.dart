import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';

GlobalKey globalKey = new GlobalKey();
String _dataString = "Hello from this QR";

void showBottom(BuildContext context, category, time, fare, start, end) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final bodyHeight = MediaQuery.of(context).size.height/4 -
            MediaQuery.of(context).viewInsets.bottom;
        return Container(
          height: 300,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10),
              Center(
                  child: Text(
                "$category",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Total Fare:  Rs." + "$fare",
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Starting Point:  " + "$start",
                        style: TextStyle(fontSize: 20)),
                  )),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("End Point:  " + "$end",
                        style: TextStyle(fontSize: 20)),
                  )),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Starting Time:  " + "$time",
                          style: TextStyle(fontSize: 20)))),
              SizedBox(height: 40),
              Padding(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => qr(bodyHeight)),
                            );
                            Fluttertoast.showToast(
                                msg: "Ticket Booked",
                                toastLength: Toast.LENGTH_SHORT);
                          },
                          child: Text("Book Ticket"))))
            ],
          ),
        );
      });
}

Widget qr(context) {
  return Scaffold(
      body: Container(
    child: Center(
      child: RepaintBoundary(
        key: globalKey,
        child: QrImage(
          data: _dataString,
           
          size: context/3,
        ),
      ),
    ),
  ));
}
