import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Promo extends StatefulWidget {
  @override
  _Promo createState() => _Promo();
}

Future<Map> getUri() async {
  String url =
      'http://apigo-docker.herokuapp.com/heroku_83210746493cc84/promo/1';
  Response response = await get(url);
  return json.decode(response.body);
}

class _Promo extends State<Promo> {
  @override
  Widget build(BuildContext context) {
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
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Text(data["name"].toString()),
                          Text(data["name"].toString()),
                          Text(data["name"].toString()),
                          Text(data["name"].toString()),
                        ],
                      ),
                    );
                  });
            } else {
              return Text("No Data");
            }
          }),
    ));
  }
}
