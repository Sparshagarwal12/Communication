import 'package:communication/User/promo.dart';
import 'package:communication/User/userDaashboard.dart';
import 'package:communication/privateAuthority/details.dart';
import 'package:communication/screen/login.dart';
import 'package:communication/screen/start.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'Login/userLogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class Example extends StatefulWidget {
  @override
  _Example createState() => _Example();
}

class _Example extends State<Example> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    UserDashboard(),
    UserDashboard(),
    UserDashboard(),
    Promo()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 4,
                activeColor: Colors.white,
                iconSize: 20,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: LineIcons.dashboard,
                    text: 'DashBoard',
                  ),
                  GButton(
                    icon: LineIcons.train,
                    text: 'Live Status',
                  ),
                  GButton(
                    icon: LineIcons.calendar,
                    text: 'Planner',
                  ),
                  GButton(
                    icon: LineIcons.location_arrow,
                    text: 'Benefits',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
