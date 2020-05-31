import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Benefit extends StatefulWidget {
  @override
  _Benefit createState() => _Benefit();
}

TextEditingController name = new TextEditingController();
TextEditingController promo = new TextEditingController();
TextEditingController price = new TextEditingController();
TextEditingController valid = new TextEditingController();
void makePost(String a, String b, String c, String d) async {
  String url = 'http://apigo-docker.herokuapp.com/heroku_83210746493cc84/promo';
  var body = {
    "name": a,
    "price": b,
    "promo": c,
    "valid": d,
  };
  http.Response r = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: json.encode(body),
  );
}

class _Benefit extends State<Benefit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: name,
            decoration: InputDecoration(
              labelText: "Enter Your Comapny Name",
            ),
          ),
          TextField(
            controller: promo,
            decoration: InputDecoration(
              labelText: "Enter PromoCode",
            ),
          ),
          TextField(
            controller: valid,
            decoration: InputDecoration(
              labelText: "Enter Validitiy Date",
            ),
          ),
          TextField(
            controller: price,
            decoration: InputDecoration(
              labelText: "Enter Price",
            ),
          ),
          RaisedButton(
            onPressed: () {
              var a = name.text;
              var b = price.text;
              var c = promo.text;
              var d = valid.text;
              makePost(a, b, c, d);
              name.clear();
              price.clear();
              promo.clear();
              valid.clear();
            },
            child: Text("Submit"),
          )
        ],
      )),
    );
  }
}
