import 'package:communication/privateAuthority/addVehical.dart';
import 'package:communication/privateAuthority/benefit.dart';
import 'package:communication/privateAuthority/myVehicals.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class PrivateDashboard extends StatefulWidget {
  @override
  _PrivateDashboard createState() => _PrivateDashboard();
}

class _PrivateDashboard extends State<PrivateDashboard> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MyVehicals(),
    AddVehical(),
    AddVehical(),
    Benefit()
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
                    icon: LineIcons.bicycle,
                    text: 'My Vehicals',
                  ),
                  GButton(
                    icon: LineIcons.train,
                    text: 'Live Status',
                  ),
                  GButton(
                    icon: LineIcons.car,
                    text: 'Add Vehicals',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Benefit',
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
