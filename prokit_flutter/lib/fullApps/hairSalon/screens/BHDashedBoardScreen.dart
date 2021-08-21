import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'BHAppointmentScreen.dart';
import 'BHDiscoverScreen.dart';
import 'BHMessagesScreen.dart';
import 'BHNotifyScreen.dart';
import 'BHProfileScreen.dart';

class BHDashedBoardScreen extends StatefulWidget {
  static String tag = '/DashedBoardScreen';

  @override
  BHDashedBoardScreenState createState() => BHDashedBoardScreenState();
}

class BHDashedBoardScreenState extends State<BHDashedBoardScreen> {
  int _selectedIndex = 0;
  var _pages = <Widget>[
    BHDiscoverScreen(),
    BHNotifyScreen(),
    BHAppointmentScreen(),
    BHMessagesScreen(),
    BHProfileScreen(),
  ];

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: BHColorPrimary),
      selectedItemColor: BHColorPrimary,
      unselectedLabelStyle: TextStyle(color: BHGreyColor),
      unselectedItemColor: BHGreyColor,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Discover'),
        BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Notify'),
        BottomNavigationBarItem(icon: Icon(Icons.date_range),label: 'Appointment'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.white);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _bottomTab(),
        body: Center(child: _pages.elementAt(_selectedIndex)),
      ),
    );
  }
}
